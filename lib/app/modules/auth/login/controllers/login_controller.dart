// ignore_for_file: unnecessary_overrides, avoid_print
import 'package:easybill_app/app/constants/app_string.dart';
import 'package:easybill_app/app/widgets/set_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../constants/bools.dart';
import '../../../../constants/utils.dart';
import '../../../../data/api/local_storage.dart';
import '../../../../data/models/login.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/custom_widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController staffMobileController = TextEditingController();
  TextEditingController staffPwdController = TextEditingController();

  final AuthRepo _authRepo = AuthRepo();
  List<Login>? loginList;

  bool isStaffTabTapped = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    print('Login init called --------------->>');
    super.onInit();
    getDeviceInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // mobileController.dispose();
    // pwdController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      EBBools.isLoading = true;
      final login = Login(
        loginmobilenumber: isStaffTabTapped
            ? staffMobileController.text.trim()
            : mobileController.text.trim(),
        userpassword: isStaffTabTapped
            ? staffPwdController.text.trim()
            : pwdController.text.trim(),
        userrole: isStaffTabTapped ? 'Staff' : 'Admin',
        loggedindeviceid: deviceID,
        loggedindevicename: deviceName,
      );
      final res = await _authRepo.login(login);
      EBBools.isLoading = false;
      loginList = res;

      int? userRegiserId = loginList?[0].userregistrationid;
      int? usercredentialsid = loginList?[0].usercredentialsid;
      if (userRegiserId != null) {
        try {
          LocalStorage.writeUserLoginId(usercredentialsid.toString());
          print(
              "user credentials Id --------->> : ${await LocalStorage.getUserLoginId()}");
          LocalStorage.writeUserId(userRegiserId.toString());
          print(
              "User register id -------->> : ${await LocalStorage.getUserId()}");
        } catch (e) {
          debugPrint('errod --------->>  $e');
        }
      }

      if (res != null) {
        if (res[0].gst != null) {
          EBBools.isTaxNeeded = res[0].gst!;
        }
        for (var element in res) {
          if (element.userrole == 'Staff') {
            print('staff login --------->>  ');
            print(element.userrole);
            print(element.username);
            print(element.userpassword);
            print(element.loginmobilenumber);

            if (element.screenaccess != null) {
              EBAppString.screenAccessList = [...element.screenaccess!];
              for (var screens in element.screenaccess!) {
                print('screens ------->> $screens');
              }
            }

            EBAppString.productlanguage = element.productlanguage;

            print(
                "product language ------------------------------------------------------------------>>  ${element.productlanguage}");
          } else {
            print('Admin login --------->>  ');
            print(element.userrole);
            print(element.username);
            print(element.userpassword);
            print(element.loginmobilenumber);
            print(element.businessname);
            print(element.email);
            print(element.gst);
            print(element.gstnumber);
            print(element.loggedindevicename);
            if (element.screenaccess != null) {
              EBAppString.screenAccessList = [...element.screenaccess!];
              for (var screens in element.screenaccess!) {
                print('screens ------->> $screens');
              }
            }
            EBAppString.productlanguage = element.productlanguage;
            print(
                "product language ------------------------------------------------------------------>>  ${element.productlanguage}");
          }
        }
        routingForLogin(res);

        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void routingForLogin(List<Login>? userList) {
    if (userList == null) return;
    int decisionKey = userList[0].decisionkey!;
    switch (decisionKey) {
      case 0:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Not Registered');
        Get.toNamed(Routes.REGISTER);
        break;
      case 1:
        debugPrint('decision key --------------->>  $decisionKey');

        Get.offAllNamed(
            isStaffTabTapped ? Routes.CASHIER_BILLS : Routes.INVENTORY,
            arguments: {'triggeredFromStaff': false});
        break;
      case 2:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('No subscription');
        Get.toNamed(Routes.SUBSCRIPTION);

        break;
      case 3:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Invalid credentials');
        break;
      case 4:
        debugPrint('decision key --------------->>  $decisionKey');
        SetPasswordAlertDialog.setPasswordAlertDialof(
            formKey: GlobalKey<FormState>(),
            loginMobileNum: mobileController.text,
            triggeredFromLogin: true);
        EBCustomSnackbar.show('Create password');
        break;
      case 5:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Subscription expired');
        break;
      case 6:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Already logged in another device');
        break;
      case 7:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Contact adminstrator');
        break;
      default:
        debugPrint('decision key --------------->>  $decisionKey');
        print('Something went Wrong No decision key matches');
        break;
    }
  }

// ------------------------------------------------------------------
  void loginPressed({String? pwd}) {
    print(
        'Local storage User register id -------------->>  ${LocalStorage.registeredUserId}');
    if (formKey.currentState?.validate() == true) {
      if (pwd != null) {
        setPassword(pwd);
      } else {
        login();
        // Get.offAllNamed(
        //     isStaffTabTapped ? Routes.CASHIER_BILLS : Routes.INVENTORY,
        //     arguments: {'triggeredFromStaff': false});
      }
      update();
    }
  }

  Future<void> setPassword(String pwd) async {
    print('setPassword api called--------->>  ');
    try {
      final login = Login(
        userpassword: pwd,
      );
      final res = await _authRepo.setPassword(login);

      print('------------------------->> result  : $res');
      print('setPassword mehtod ended--------->>  ');
      navigationForSettingPwd(res);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigationForSettingPwd(List<Login>? login) {
    if (login == null) return;
    int decisionKey = login[0].decisionkey!;
    switch (decisionKey) {
      case 0:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Not Registered');
        Get.toNamed(Routes.REGISTER);
        break;
      case 1:
        debugPrint('decision key --------------->>  $decisionKey');
        Get.offAllNamed(Routes.LOGIN);
        break;
      case 2:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('No subscription');
        Get.toNamed(Routes.SUBSCRIPTION);
        break;
      case 3:
        debugPrint('decision key --------------->>  $decisionKey');
        EBCustomSnackbar.show('Password already created');
        break;
      default:
        debugPrint('decision key --------------->>  $decisionKey');
        debugPrint('Some this went wrong  ------------------??  ');
        // Handle unexpected values
        break;
    }
  }

  void onTabChanged(int index) {
    formKey = GlobalKey<FormState>();

    if (index == 1) {
      mobileController.clear();
      pwdController.clear();
      isStaffTabTapped = true;
    } else {
      staffMobileController.clear();
      staffPwdController.clear();
      isStaffTabTapped = false;
    }
  }
}
