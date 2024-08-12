// ignore_for_file: prefer_adjacent_string_concatenation



class EBAppString {
  // App title
  static const String tile = 'Daddy POS';
  static const String createUser = 'Create User';
  static const String businessLogo = 'Business Logo';

// Drawer String
  static const String orderPlace = 'Order place';
  static const String productList = 'Product List';
  static const String setting = 'Setting';
  static const String profile = 'Profile';
  static const String help = 'Help';
  static const String inventoryStocks = 'Inventory / Stocks';
  static const String staff = 'Staff';
  static const String report = 'Report';
  static const String cancleBill = '$cancel bill';
  static const String cancleReport = '$cancel $report';
  static const String billWiseReport = 'Bill Wise $report';
  static const String productWiseReport = 'Product Wise $report';
  static const String staffWiseReport = '$staff Wise $report';
  static const String overView = 'Overview';
// TextForm field
  static const String mobile = 'Mobile Number';
  static const String pass = 'Password';
  static const String email = 'Email';
  static const String upiId = 'UPI ID';
  static const String business = 'Business Name';
  static const String address = 'Address';
  static const String gst = 'GST No';
  static const String tax = 'Default Tax Persentage %';
  static const String search = 'Search';
  static const String loginUserName = '$login username';
  static const String userName = 'User name';
  static const String userpass = 'User $pass';
  static const String quantity = ' Quantity';

// Admin Setting
  static const String invoiceSetting = 'Ivoice $setting';
  static const String taxSetting = 'Tax $setting';
  static const String printerSetting = '${print}er $setting';
  static const String language = 'Language';
  static const String disconnect = 'Disconnect';
  static const String autoCut = 'Auto Cut';
  static const String companyLogo = 'Company Logo';
  static const String footer = 'Footer';
  static const String whatsApp = 'Whats App';

// Button
  static String save = 'Save';
  static const String login = 'Login';
  static const String staffLogin = 'Staff $login';
  static const String register = 'Register';
  static const String logoutFromOtherDevices =
      'Logout from other devices & continue';
  static const String logout = 'Log Out';
  static const String create = 'Create';
  static const String delete = 'Delete';
  static const String allClear = 'All clear';
  static const String next = 'Next';
  static const String update = 'Update';
  static const String summit = 'Summit';
  static const String print = 'Print';
  static const String printBill = 'Print Bill';
  static const String cancel = 'Cancel';
  static const String add = 'Add';
  static const String filterByPaymentmode = 'Filter by Paymentmode';
  static const String addItems = 'Add Items';
  static const String edit = 'Edit';
  static const String updatePassword = '$update $pass';
  static const String gstApplication = 'GST Application';
  static const String staffRegister = 'Staff $register';
  static const String addStaff = '$add $staff';
  static const String cancelOrder = '$cancel order';

  static const String signOut = 'Sign Out';

// Admin Page
  static const String addProduct = 'Add Product';
  static const String addCategory = 'Add Category';

  // Add Category
  static const String createNew = 'Create New Product+';

  // Add Product
  static const String native = 'Native';
  static const String english = 'English';
  static const String itemId = 'Item ID No';
  static const String itemName = 'Item Name';
  static const String category = 'Category';
  static const String token = 'Token';
  static const String price = 'Price';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String stock = 'Stock';
  static const String taxType = 'Tax Type';
  static const String taxPer = 'Tax %';
  static const String barcode = 'Barcode';

  // Tab bar
  static const String quickSale = 'Quick Sale';
  static const String salesAll = 'Sales / All';

// App content
  static const String invoicePrefix = 'Invoice Prefix :';
  static const String invoiceNumber = 'Invoice Number :';
  static const String staffDetails = '$staff Details';

// Storage and Databases
  static const String articlesTableName = 'articles_table';
  static const String databaseName = 'app_database.db';

// App assets Images
  static const String businessLogoImg = 'assets/icons/add_image.png';
  static const String profileImg = 'assets/icons/profile.png';
  static const String daddyPosImg = 'assets/icons/icons_lancher.png';
  static const String ogDaddyPosImg = 'assets/images/daddy_poc.png';

  static String units = 'Units';

  static const String currencySymbol = 'Currency Symbol';

  static const String theme = 'Theme';

  static const String printer = 'Printer';

  static const String invoice = 'Invoice';

  static const String refresh = 'Refresh';

  static const String qrBarcode = 'Qr/Barcode';

  static const String dayEndReport = 'Day end report';
  static String? productlanguage;
  static String? businessName;
  static String? businessMobile;
  static String? businessEmail;
  static String? userRole;

  static List<String> screenAccessList = [];

  static String? loginmobilenumber;

  static String? responseMsg;

  static const String bluetooth = 'Bluetooth';

  static const String usb = 'USB';

  static String? settimeinterval;

  static const String changePaymentMode = 'Change Payment Mode';

  static const String filter = 'Filter';

  // static const String billTemplate = '';
  // static const String billData = '';
  // static const String rate = '';
  // static const String qty = '';
  // static const String totlaQty = '';
  // static const String amt = '';
  // static const String totlaAmt = '';

  // static const String imageTagW1linebreak = "[C]<img>$billData</img>"+"\n";
  // static const String imageTagW2linebreak =
  //     "[C]<img>$billData</img>" + "\n\n";
  // static const String billPhone = "[C]<b>Mob: $billData</b>"+"\n\n";
  // static const String billNo =
  //     "[L]<b><font size='big'>Bill No: $billData</font></b>"+"\n\n";
  // static const String inch2divider =
  //     "[C]<b>--------------------------------</b>\n";
  // static const String inch3divider =
  //     "[C]<b>------------------------------------------------</b>\n";
  // static const String billDateTime =
  //     "[L]<b><font size='normal'>Date: $billData</font></b>[R]<b>Time: $billData</font></b>"+"\n";
  // static const String inch2billTopColumn =
  //     "[L]<b><font size='normal'>Sr</font></b>[L]<b><font size='normal'>Name</font></b>[R]<b><font size='normal'>Rate</font></b>[C]<b><font size='normal'>Qty</font></b>[C]<b><font size='normal'>Amount</font></b>\n";
  // static const String inch3billTopColumn =
  //     "[L]<b><font size='normal'>Sr</font></b>[L]<b><font size='normal'>Name</font></b>[R]<b><font size='normal'>Rate</font></b>[R]<b><font size='normal'>Qty</font></b>[R]<b><font size='normal'>Amount</font></b>\n";
  // static const String billProduct = '[L]<img>"$billData"</img>''\n';
  // static const String inch2billPriceQtyAmt =
  //     "[L][L][R]<b><font size='normal'>$rate</font></b>[C]<b><font size='normal'>$qty</font></b>[C]<b><font size='normal'>$amt</font></b>"+"\n";
  // static const String inch3billPriceQtyAmt =
  //     "[L][L][R]<b><font size='normal'>$rate</font></b>[R]<b><font size='normal'>$qty</font></b>[R]<b><font size='normal'>$amt</font></b>"+"\n";
  // static const String billBottomColumn =
  //     "[L]<b><font size='normal'>Items: $billData</font></b>[C]<b><font size='normal'>Qty:$totlaQty</font></b>[R]<b><font size='normal'>$totlaAmt</font></b>"+"\n";
  // static const String billDataTotalAmt =
  //     "[C]<b size='tall'><font size='tall'>Rs $totlaAmt</font></b>" + "\n\n";
  // static const String billFooter =
  //    "[C]<b><font size='normal'>$billData</font></b>" +"\n\n\n\n";

}
