// ignore_for_file: no_wildcard_variable_uses

import 'package:easybill_app/app/widgets/custom_widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/app_text_style.dart';
import '../../../../constants/size_config.dart';
import '../../../../constants/themes.dart';
import '../../../../widgets/custom_widgets/custom_container.dart';
import '../../../../widgets/custom_widgets/custom_elevated_icon_button.dart';
import '../../../../widgets/custom_widgets/custom_list_tile.dart';
import '../controllers/choose_printer_controller.dart';

class ChoosePrinterView extends GetView<ChoosePrinterController> {
  const ChoosePrinterView({super.key});

  @override
  Widget build(BuildContext context) {
    return EBCustomScaffold(
      noDrawer: true,
      body: GetBuilder<ChoosePrinterController>(builder: (controller) {
        return SafeArea(
          child: Padding(
            padding: EBSizeConfig.edgeInsetsActivitiesDouble,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomElevatedIconButton(
                  onPressed: () {
                    //   controller.initBluetoothState();
                    controller.checkBlutoothAvailability();
                    controller.fetchingBtDevices();
                    controller.update();
                    // await controller.disconnectDevice();
                  },
                  iconData: Icons.refresh_outlined,
                  label: Text(
                    EBAppString.refresh,
                    style: EBAppTextStyle.button,
                  ),
                ),
                Expanded(
                  child: GetBuilder<ChoosePrinterController>(builder: (_) {
                    if (_.isBluetoothAvailable == false) {
                      return Padding(
                        padding: EBSizeConfig.edgeInsetsActivities,
                        child: Center(
                          child: Text(
                              'Please Turn on Bluetooth or verify concern bluetooth device is on',
                              style: EBAppTextStyle.bodyText),
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: _.devices!.length,
                        itemBuilder: (context, index) {
                          debugPrint(
                              '---------------------->> device name : ${_.devices![index].name}');

                          return GestureDetector(
                            onTap: (){
                              _.selectedPrinter(_.devices?[index]);
                              _.update();
                            },
                            child: CustomContainer(
                              color: EBTheme.kPrimaryWhiteColor,
                              noHeight: true,
                              borderColor: EBTheme.kPrimaryColor,
                              borderWidth: 0.5,
                              child: EBCustomListTile(
                                leading: const Icon(
                                  Icons.print_rounded,
                                  size: 25,
                                ),
                                titleName: '${_.devices![index].name}',
                                subtitle: Text(
                                  '${_.devices![index].address}',
                                  style: EBAppTextStyle.bodyText,
                                ),
                                trailingIcon: Icons.add,
                                trailingIconSize: 25,
                              ),
                            ),
                          );
                        });
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
