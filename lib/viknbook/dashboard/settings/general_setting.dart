// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../app/modules/home/controllers/home_controller.dart';
// import 'package:get/get.dart';
//
// import '../../custom/global.dart';
//
//
//
// class GeneralSetting extends StatefulWidget {
//   @override
//   State<GeneralSetting> createState() => _GeneralSettingState();
// }
//
// class _GeneralSettingState extends State<GeneralSetting> {
//   HomeController themeChangeController = Get.put(HomeController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     final mHeight = MediaQuery.of(context).size.height;
//     final mWidth = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: Colors.transparent,
//         titleSpacing: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back),
//           color: themeChangeController.isDarkMode.value
//               ? Colors.white
//               : Color(0xff000000),
//         ),
//         centerTitle: false,
//         title: Text(
//           "General Settings",
//           style: customisedStyleBold(
//               context,
//               themeChangeController.isDarkMode.value
//                   ? Colors.white
//                   : Colors.black,
//               FontWeight.w500,
//               16.0),
//         ),
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             DividerStyle(),
//             Text("Decimal Points",style: customisedStyleBold(
//                 context,
//                 themeChangeController.isDarkMode.value
//                     ? Colors.white
//                     : Colors.black,
//                 FontWeight.w500,
//                 14.0),)
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
///chng
import 'dart:convert';
import 'package:get/get.dart';
import '../../../app/modules/home/controllers/home_controller.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../custom/global.dart';





import 'package:http/http.dart' as http;

import '../../custom/common_used_alerts.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool general = false;
  bool multiUnitSwitch = false;
  bool inclusiveRateWorkOrderSwitch = false;
  bool priceCategorySwitch = false;
  bool voucherNumberAutoGenSwitch = false;
  bool enableProductBatchwiseSwitch = false;
  bool enableTranslationSwitch = false;
  bool showYearMonthFor_Exp_Man_Date = false;
  bool allowNegativeStockSwitch = false;
  bool showWarrantyPeriodSwitch = false;
  bool enableFearaSetting = false;
  bool enableBillWise = false;

  bool quickAddSaleSwitch = false;
  bool showSalesTypeSwitch = false;
  bool showNegativeStockSalesSwitch = false;
  bool freeQuantitySaleSwitch = false;
  bool inclusiveRateSalesSwitch = false;
  bool showDiscountSaleSwitch = false;
  bool quickAddSwitch = false;
  bool allowReceiptMoreSaleAmt = false;
  bool allowAdvanceReceiptSwitch = false;
  bool salesPriceUpdateSwitch = false;
  bool allowQuantityDividerSwitch = false;
  bool blockSalesMRPSwitch = false;
  bool showSettingSaleSwitch = false;

  bool freeQuantityPurchaseSwitch = false;
  bool showPurchaseTypeSwitch = false;
  bool inclusiveRatePurchaseSwitch = false;
  bool showDiscountInPurchaseSwitch = false;
  bool purchasePriceUpdateSwitch = false;
  bool showManAndExpiryDateSwitch = false;
  bool allowReceiptMoreThanPurchaseSwitch = false;
  bool referenceBillNumberSwitch = false;
  bool showSalesPriceInPurchaseSwitch = false;
  bool showCustomerPurchaseSwitch = false;
  bool settingPurchaseSwitch = false;
  bool billDiscount = true;
  bool enableCardNetWork = false;
  bool enableCardDetails = false;
  bool showDiscountInPayment = false;
  bool showDiscountInReceipts = false;
  bool enableLoyaltySettings = false;

  Color button1TextColor = Color(0xffffffff);
  Color button2TextColor = Color(0xffffffff);
  Color button3TextColor = Color(0xffffffff);

  Color button1BackColor = Color(0xff009253);
  Color button2BackColor = Color(0xff171717);
  Color button3BackColor = Color(0xff171717);
  Color buttonBack1 = Color(0xff009253);
  Color buttonBack2 = Color(0xff171717);
  TextEditingController preDateController = TextEditingController();
  TextEditingController postDateController = TextEditingController();
  TextEditingController qtyDecimalController = TextEditingController();
  TextEditingController priceDecimalController = TextEditingController();
  TextEditingController roundingController = TextEditingController();
  TextEditingController purchaseGstController = TextEditingController();
  TextEditingController saleGstController = TextEditingController();
  FocusNode qtyDecimalFCNode = FocusNode();
  FocusNode priceDecimalFCNode = FocusNode();
  FocusNode roundingFCNode = FocusNode();

  int buttonStatus = 1;
  int index = 0;
  String postDate = '';
  String preDate = '';
  String qtyDec = '';
  String priceDec = '';
  String rounding = '';

  HomeController themeChangeController = Get.put(HomeController());





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: themeChangeController.isDarkMode.value
              ? Colors.white
              : Color(0xff000000),
        ),
        centerTitle: false,
        title: Text(
          "General Settings",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),

      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: ListView(
            children: [
              general == true ? generalPurchaseSalesDetail() : settingDetail(),

            ],
          ),
        ),
      ),
      bottomNavigationBar:  Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height /
                15, //height of button
            width: MediaQuery.of(context).size.width / 1,
            // child: paidList(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextButton(
                    child: Text(
                      "Cancel",
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: buttonBack1),
                    onPressed: () {
                      setState(() {
                        buttonBack1 = Color(0xff009253);
                        buttonBack2 = Color(0xff171717);
                      });
                      // print('Pressed');
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height /
                      20, //height of button
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextButton(
                    child: Text(
                      "Done",
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: buttonBack2),
                    onPressed: () {}

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///purchase,sale,general details
  Widget generalPurchaseSalesDetail() {
    return Container(
//color: Colors.red,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 17,
            width: MediaQuery.of(context).size.width / 1.1,
            child: selectButtons(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.34,
            width: MediaQuery.of(context).size.width / 1.1,
            child: selectButtonDetails(buttonStatus),
          ),
        ],
      ),
    );
  }

  ///settings page
  Widget settingDetail() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 9, //height of button
            width: MediaQuery.of(context).size.width / 1.1,
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Decimal_Points",
                    style: TextStyle(
                    ),
                  ),
                  decimalPointFields()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          discountType(),
          const SizedBox(
            height: 12,
          ),

          ///default values commented here
          defaultValues(),
          const SizedBox(
            height: 15,
          ),
          Container(
            //   alignment: Alignment.center,

            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 18,
            //height of button
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
                controller: preDateController,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),

                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,8}')),
                ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            //   alignment: Alignment.center,

            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 18,
            //height of button
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextField(
                controller: postDateController,
                //  textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.digitsOnly,

                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,8}')),
                ],
            ),
          ),

          const SizedBox(
            height: 8,
          ),
          enableCardNetwork(),
          enableCardPayment(),

          Container(
            height: MediaQuery.of(context).size.height / 21, //height of button
            width: MediaQuery.of(context).size.width / 1.2,
            // child: paidList(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height /
                      18, //height of button
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "Enable Bill"

                    ,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,

                  height: MediaQuery.of(context).size.height /
                      18, //height of button
                  width: MediaQuery.of(context).size.width / 7,
                  child: FlutterSwitch(
                    width: 40.0,
                    height: 20.0,
                    valueFontSize: 30.0,
                    toggleSize: 15.0,
                    value: enableBillWise,
                    borderRadius: 20.0,
                    padding: 1.0,





                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        enableBillWise = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          showDiscountInPayments(),
          showDiscountInReceipt(),
          enableLoyaltySetting(),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget decimalPointFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          //   alignment: Alignment.center,


          height: MediaQuery.of(context).size.height / 18, //height of button
          width: MediaQuery.of(context).size.width / 3.7,
          child: TextField(
            //  textAlignVertical: TextAlignVertical.center,
              controller: qtyDecimalController,

              focusNode: qtyDecimalFCNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(priceDecimalFCNode);
              },
              keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
              ],
          ),
        ),
        Container(
          //   alignment: Alignment.center,


          height: MediaQuery.of(context).size.height / 18, //height of button
          width: MediaQuery.of(context).size.width / 3.7,
          child: TextField(
              controller: priceDecimalController,
              focusNode: priceDecimalFCNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(roundingFCNode);
              },
              //  textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
                decimal: false,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
              ],


          ),
        ),

        ///rounding decimal commented here
        Container(
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 3.7,
            decoration: BoxDecoration(

              // border: Border.all(
              //     color: Styles.borderColors)
            ),
            child: TextField(
                keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,8}')),
                ],
                //  textAlignVertical: TextAlignVertical.center,


                textAlign: TextAlign.center,

            )),
      ],
    );
  }

  Widget discountType() {
    return Container(
      height: MediaQuery.of(context).size.height / 9, //height of button
      width: MediaQuery.of(context).size.width / 1.1,

      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discount Type",

            ),
            Container(
              height:
              MediaQuery.of(context).size.height / 21, //height of button
              width: MediaQuery.of(context).size.width / 1.1,
              // child: paidList(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height /
                        18, //height of button
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                     "Bill Discount",
                      style: TextStyle(

                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,

                    height: MediaQuery.of(context).size.height /
                        18, //height of button
                    width: MediaQuery.of(context).size.width / 7,
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 20.0,
                      valueFontSize: 30.0,
                      toggleSize: 15.0,
                      value: billDiscount,
                      borderRadius: 20.0,
                      padding: 1.0,
                      activeColor: Colors.green,
                      activeTextColor: Colors.green,



                      // showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          billDiscount = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget defaultValues() {
    return Container(
      height: MediaQuery.of(context).size.height / 6, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(

      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Default Value",

            ),
            Container(

              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 20,
              //height of button
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextField(
                onTap: () async {


                },
                controller: purchaseGstController,
                readOnly: true,
                textAlign: TextAlign.left,

                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,

                  ),
                  contentPadding: EdgeInsets.all(7),
                  enabledBorder: InputBorder.none,

                  filled: true,
                  focusedBorder: InputBorder.none,

                  hintStyle: TextStyle(

                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),

                height: MediaQuery.of(context).size.height / 20,
                //height of button
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  onTap: () async {





                  },
                  controller: saleGstController,
                  readOnly: true,
                  textAlign: TextAlign.left,

                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,

                    ),
                    contentPadding: EdgeInsets.all(7),
                    enabledBorder: InputBorder.none,

                    filled: true,
                    focusedBorder: InputBorder.none,

                    hintStyle: TextStyle(

                    ),
                  ),
                )

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Purchase GST',
              //       style:
              //           TextStyleDecoration.text(context),
              //     ),
              //     Icon(
              //       Icons.arrow_drop_down,
              //       color: Repository.textColor(context),
              //     )
              //   ],
              // )
            ),
          ],
        ),
      ),
    );
  }

  Widget enableCardNetwork() {
    return Container(
      height: MediaQuery.of(context).size.height / 21, //height of button
      width: MediaQuery.of(context).size.width / 1.2,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Enable Card"

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: enableCardNetWork,
              borderRadius: 20.0,
              padding: 1.0,





              onToggle: (val) {
                setState(() {
                  enableCardNetWork = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget enableCardPayment() {
    return Container(
      height: MediaQuery.of(context).size.height / 21, //height of button
      width: MediaQuery.of(context).size.width / 1.2,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Enable Card",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: enableCardDetails,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  enableCardDetails = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget showDiscountInPayments() {
    return Container(
      height: MediaQuery.of(context).size.height / 21, //height of button
      width: MediaQuery.of(context).size.width / 1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Discount Paayment"),


          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showDiscountInPayment,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showDiscountInPayment = val;
                });
              },




    ))]));
  }

  Widget showDiscountInReceipt() {
    return Container(
      height: MediaQuery.of(context).size.height / 21, //height of button
      width: MediaQuery.of(context).size.width / 1.2,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Discount Receipt"),


          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showDiscountInReceipts,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showDiscountInReceipts = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget enableLoyaltySetting() {
    return Container(
      height: MediaQuery.of(context).size.height / 21, //height of button
      width: MediaQuery.of(context).size.width / 1.2,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
"Enable Loyalty",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: enableLoyaltySettings,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  enableLoyaltySettings = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  selectButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 20, //height of button
          width: MediaQuery.of(context).size.width / 3.5,
          child: TextButton(
            child: Text(
              "General"),


            style: TextButton.styleFrom(
                foregroundColor: button1TextColor, backgroundColor: button1BackColor),
            onPressed: () {
              setState(() {
                buttonStatus = 1;
                selectColor(buttonStatus);
              });
              // print('Pressed');
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 20, //height of button
          width: MediaQuery.of(context).size.width / 3.5,
          child: TextButton(
            child: Text(
              "Sales",
              style: TextStyle(
                  fontSize: 11,color: button2TextColor
              ),
            ),
            style: TextButton.styleFrom(
                foregroundColor: button2TextColor, backgroundColor: button2BackColor),
            onPressed: () {
              setState(() {
                buttonStatus = 2;
                selectColor(buttonStatus);
              });
              // print('Pressed');
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 20, //height of button
          width: MediaQuery.of(context).size.width / 3.5,
          child: TextButton(
            child: Text(
              "Purchase",
              style: TextStyle(
                  fontSize: 11,color: button3TextColor
              ),
            ),
            style: TextButton.styleFrom(
                foregroundColor: button3TextColor, backgroundColor: button3BackColor),
            onPressed: () {
              setState(() {
                buttonStatus = 3;
                selectColor(buttonStatus);
              });
              // print('Pressed');
            },
          ),
        ),
      ],
    );
  }

  selectButtonDetails(int buttonStatus) {
    if (buttonStatus == 1) {
      return generalDetail();
    } else if (buttonStatus == 2) {
      return salesDetails();
    } else if (buttonStatus == 3) {
      return purchaseDetails();
    }
  }

  Widget generalDetail() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        multiUnit(),
        inclusiveRateWorkOrder(),
        priceCategory(),
        voucherNumberAutoGenerate(),
        enableProductBatchWise(),
        enableTranslationProduct(),
        Container(
          height: MediaQuery.of(context).size.height / 20, //height of button
          width: MediaQuery.of(context).size.width / 1.1,
          // child: paidList(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height:
                MediaQuery.of(context).size.height / 18, //height of button
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                 "Enable Feara",

                ),
              ),
              Container(
                alignment: Alignment.centerRight,

                height:
                MediaQuery.of(context).size.height / 18, //height of button
                width: MediaQuery.of(context).size.width / 7,
                child: FlutterSwitch(
                  width: 40.0,
                  height: 20.0,
                  valueFontSize: 30.0,
                  toggleSize: 15.0,
                  value: enableFearaSetting,
                  borderRadius: 20.0,
                  padding: 1.0,

                    onToggle: (val) {
                    setState(() {
                      enableFearaSetting = val;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        yearMonthCalenderForExpiryAndManufacture(),
        negativeStockProduct(),
        showWarrantyPeriodProduct(),
      ],
    );
  }

  Widget multiUnit() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Multi Unit",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: multiUnitSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  multiUnitSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget inclusiveRateWorkOrder() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Inclusive Rate",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: inclusiveRateWorkOrderSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  inclusiveRateWorkOrderSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget priceCategory() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
            "Price Category",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: priceCategorySwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  priceCategorySwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget voucherNumberAutoGenerate() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
             "Voucher No",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: voucherNumberAutoGenSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  voucherNumberAutoGenSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget enableProductBatchWise() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Enable Product Batch wise",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: enableProductBatchwiseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  enableProductBatchwiseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget enableTranslationProduct() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Enable Transaction",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: enableTranslationSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  enableTranslationSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget yearMonthCalenderForExpiryAndManufacture() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Manufacture Date",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showYearMonthFor_Exp_Man_Date,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  showYearMonthFor_Exp_Man_Date = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget negativeStockProduct() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              " Negative Stock",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: allowNegativeStockSwitch,
              borderRadius: 20.0,
              padding: 1.0,

              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  allowNegativeStockSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showWarrantyPeriodProduct() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Show Warranty",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showWarrantyPeriodSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  showWarrantyPeriodSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  selectColor(int buttonStatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var p = prefs.getBool('isDark') ?? true;

    if (p == true) {
      if (buttonStatus == 1) {
        button1BackColor = Color(0xff009253);
        button2BackColor = Color(0xff171717);
        button3BackColor = Color(0xff171717);
        button1TextColor = Color(0xffffffff);
        button2TextColor = Color(0xffffffff);
        button3TextColor = Color(0xffffffff);
      } else if (buttonStatus == 2) {
        button2BackColor = Color(0xff009253);
        button1BackColor = Color(0xff171717);
        button3BackColor = Color(0xff171717);
        button1TextColor = Color(0xffffffff);
        button2TextColor = Color(0xffffffff);
        button3TextColor = Color(0xffffffff);
      } else if (buttonStatus == 3) {
        button3BackColor = Color(0xff009253);
        button2BackColor = Color(0xff171717);
        button1BackColor = Color(0xff171717);
        button1TextColor = Color(0xffffffff);
        button2TextColor = Color(0xffffffff);
        button3TextColor = Color(0xffffffff);
      }
    } else {
      if (buttonStatus == 1) {
        button1BackColor = Color(0xff009253);
        button2BackColor = Color(0xffEEEEEE);
        button3BackColor = Color(0xffEEEEEE);
        button1TextColor = Color(0xffFFFFFF);
        button2TextColor = Color(0xff000000);
        button3TextColor = Color(0xff000000);
      } else if (buttonStatus == 2) {
        button2BackColor = Color(0xff009253);
        button1BackColor = Color(0xffEEEEEE);
        button3BackColor = Color(0xffEEEEEE);
        button1TextColor = Color(0xff000000);
        button2TextColor = Color(0xffFFFFFF);
        button3TextColor = Color(0xff000000);
      } else if (buttonStatus == 3) {
        button3BackColor = Color(0xff009253);
        button2BackColor = Color(0xffEEEEEE);
        button1BackColor = Color(0xffEEEEEE);
        button1TextColor = Color(0xff000000);
        button2TextColor = Color(0xff000000);
        button3TextColor = Color(0xffFFFFFF);
      }
    }
  }

  Widget salesDetails() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),

        quickAddSales(),
        showSalesType(),
        allowNegativeStockSales(),
        freeQuantitySales(),
        inclusiveRatesSales(),
        showDiscountInSales(),

        ///comment allow receipt
        // allowReceiptMoreThanSale(),
        //   allowAdvanceReceiptInSales(),
        salesPriceUpdate(),
        allowQuantityDividerInSales(),
        blockSaleAboveMRP(),
        showSettingsInSales(),
      ],
    );
  }

  Widget quickAddSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Quick Add Sale",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: quickAddSaleSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  quickAddSaleSwitch = val;
                  prefs.setBool('quickAdd', quickAddSaleSwitch);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showSalesType() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Show Sale Invoice",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showSalesTypeSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  showSalesTypeSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget allowNegativeStockSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Allow Negative Stock",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showNegativeStockSalesSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  showNegativeStockSalesSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget freeQuantitySales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Free Quantity",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: freeQuantitySaleSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  freeQuantitySaleSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget inclusiveRatesSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
             "Inclusive Rate",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: inclusiveRateSalesSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  inclusiveRateSalesSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showDiscountInSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Discount Sale",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showDiscountSaleSwitch,
              borderRadius: 20.0,
              padding: 1.0,

                onToggle: (val) {
                setState(() {
                  showDiscountSaleSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget quickAddInSale() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
             "Quick Add",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: quickAddSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  quickAddSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget allowReceiptMoreThanSale() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Allow Receipt",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: allowReceiptMoreSaleAmt,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  allowReceiptMoreSaleAmt = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget allowAdvanceReceiptInSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Allow Advance",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: allowAdvanceReceiptSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  allowAdvanceReceiptSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget salesPriceUpdate() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Sales price update",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: salesPriceUpdateSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  salesPriceUpdateSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget allowQuantityDividerInSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Quantity Divider",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: allowQuantityDividerSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  allowQuantityDividerSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget blockSaleAboveMRP() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Block Sale Invoice",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: blockSalesMRPSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  blockSalesMRPSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showSettingsInSales() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Show Settings",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showSettingSaleSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showSettingSaleSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget purchaseDetails() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        freeQuantityInPurchase(),
        showPurchaseType(),
        showInclusiveRateInPurchase(),
        showDiscountInPurchase(),
        purchasePriceUpdate(),
        showManufactureAndExpiryDateInPurchase(),

        ///comment allow receipt
        // allowReceiptMoreThanPurchaseAmount(),
        referenceBillNumberInPurchase(),
        showSalesPriceInPurchase(),
        showCustomerInPurchase(),
        showSettingInPurchase(),
      ],
    );
  }

  Widget freeQuantityInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Quantity Purchase",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: freeQuantityPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  freeQuantityPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showPurchaseType() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Purchase Type",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showPurchaseTypeSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showPurchaseTypeSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showInclusiveRateInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Inclusive Rate",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: inclusiveRatePurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,

                  onToggle: (val) {
                setState(() {
                  inclusiveRatePurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showDiscountInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Disc Purchase",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showDiscountInPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showDiscountInPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget purchasePriceUpdate() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Purchase Price",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: purchasePriceUpdateSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  purchasePriceUpdateSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showManufactureAndExpiryDateInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 18, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Purchase Expiry Date",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showManAndExpiryDateSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showManAndExpiryDateSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget allowReceiptMoreThanPurchaseAmount() {
    return Container(
      height: MediaQuery.of(context).size.height / 18, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Receipt Purchase",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: allowReceiptMoreThanPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  allowReceiptMoreThanPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget referenceBillNumberInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Bill No Purchase",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: referenceBillNumberSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  referenceBillNumberSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showSalesPriceInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Sales Price Purchase",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showSalesPriceInPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showSalesPriceInPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showCustomerInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Show Customer Setting",

            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: showCustomerPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  showCustomerPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget showSettingInPurchase() {
    return Container(
      height: MediaQuery.of(context).size.height / 20, //height of button
      width: MediaQuery.of(context).size.width / 1.1,
      // child: paidList(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              "Show Setting",
            ),
          ),
          Container(
            alignment: Alignment.centerRight,

            height: MediaQuery.of(context).size.height / 18, //height of button
            width: MediaQuery.of(context).size.width / 7,
            child: FlutterSwitch(
              width: 40.0,
              height: 20.0,
              valueFontSize: 30.0,
              toggleSize: 15.0,
              value: settingPurchaseSwitch,
              borderRadius: 20.0,
              padding: 1.0,


              onToggle: (val) {
                setState(() {
                  settingPurchaseSwitch = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isGst = false;
  bool isVat = false;


}
