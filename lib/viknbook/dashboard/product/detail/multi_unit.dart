import 'package:flutter/material.dart';
import 'package:vikn_project_pro_new/viknbook/dashboard/product/detail/select_unit.dart';



import '../../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../custom/global.dart';
import '../../../custom/search_common_class.dart';

class AddMultiUnit extends StatefulWidget {
  @override
  State<AddMultiUnit> createState() => _addCustomerState();
}

class _addCustomerState extends State<AddMultiUnit> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();
  TextEditingController reverseController = TextEditingController();
  TextEditingController multiFactorController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController mrpController = TextEditingController();
  TextEditingController salePrice1Controller = TextEditingController();
  TextEditingController salePrice2Controller = TextEditingController();
  TextEditingController salePrice3Controller = TextEditingController();

  bool isUnitSale=false;
  bool isUnitPurchase=false;
  bool isUnitReport=false;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.height;
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
          "Add Multi-unit",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [
          GestureDetector(
            onTap: (){},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Save",
                  style: customisedStyleBold(
                      context, Color(0xff0A9EF3), FontWeight.w500, 16.0),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: Column(
          children: [
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextField(
                    controller: barcodeController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,labelTextStr: "Barcode",hintTextStr: "Barcode"),
                  ),
                ),
                SvgPicture.asset("assets/svg/barcode.svg")
              ],
            ),
            spaceWithHeight(8),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: unitController,
                onTap: () async {
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectUnit()),
                  );
                  print(".......................");
                  print(result[0]);
                  print(result[1]);
                  print(".......................");

                  if (result != null) {
                    setState(() {
                      unitController.text = result[1];
                    //  catUnderUID=result[0];
                      print("catUnderUID");
                    //  print(catUnderUID);
                    });
                  } else {}
                },
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: TextFieldStyle.textFieldWithIcon(context,labelText: "Unit",hintTextStr: "Unit"),
              ),
            ),

            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Reverse Factor",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: reverseController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Multi Factor",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: multiFactorController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(10),
            DividerStyle(),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Sales Price",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: salesPriceController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Purchase Price",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: purchasePriceController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Min. Price",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: minPriceController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("MRP",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: mrpController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Sales Price 1 ",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: salePrice1Controller,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Sales Price 2 ",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: salePrice2Controller,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child:Text("Sales Price 3 ",style:customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0) ,),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: salePrice3Controller,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "",
                      labelTextStr: "",),
                  ),
                ),
              ],
            ),
            spaceWithHeight(8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                             border: Border.all(

                             color:    themeChangeController.isDarkMode.value
                                     ? Color(0xff1C3347):Color(0xffE7E7E7)
                             )


              ),
              height: MediaQuery.of(context).size.height / 20,

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Unit Sales ",style:customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0) ,),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      child:   FlutterSwitch(
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 30.0,
                        toggleSize: 15.0,
                        value: isUnitSale,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                     //   inactiveTextColor: Repository.textColor(context),
                        inactiveColor: Colors.grey,
                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            isUnitSale = val;
                          });



                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            spaceWithHeight(8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(

                      color:    themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                  )


              ),
              height: MediaQuery.of(context).size.height / 20,

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Unit in Purchase ",style:customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0) ,),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      child:   FlutterSwitch(
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 30.0,
                        toggleSize: 15.0,
                        value: isUnitPurchase,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        //   inactiveTextColor: Repository.textColor(context),
                        inactiveColor: Colors.grey,
                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            isUnitPurchase = val;
                          });



                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            spaceWithHeight(8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(

                      color:    themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                  )


              ),
              height: MediaQuery.of(context).size.height / 20,

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Unit in Report ",style:customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0) ,),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      child:   FlutterSwitch(
                        width: 40.0,
                        height: 20.0,
                        valueFontSize: 30.0,
                        toggleSize: 15.0,
                        value: isUnitReport,
                        borderRadius: 20.0,
                        padding: 1.0,
                        activeColor: Colors.green,
                        activeTextColor: Colors.green,
                        //   inactiveTextColor: Repository.textColor(context),
                        inactiveColor: Colors.grey,
                        // showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            isUnitReport = val;
                          });



                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            spaceWithHeight(8),
          ],
        ),
      ),
    );
  }

}
