import 'package:flutter/material.dart';



import '../../../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../custom/global.dart';


class AddBOM extends StatefulWidget {
  @override
  State<AddBOM> createState() => _addCustomerState();
}

class _addCustomerState extends State<AddBOM> {
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
          "Add BOM",
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

                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: TextFieldStyle.textFieldWithIcon(context,labelText: "Product",hintTextStr: "Product"),
              ),
            ),

            spaceWithHeight(8),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width / 2.3,
              child: TextField(
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(27)),
                      borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(27)),
                      borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:   Icon(Icons.remove,color: Color(0xff0A9EF3),),
                    ), suffixIcon: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset("assets/svg/add.svg"),
                ),
                    labelText: "Quantity",
                    labelStyle:  customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),

                    hintText: "Quantity",

                    hintStyle: customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),
                    filled: true,
                    fillColor:themeChangeController.isDarkMode.value
                        ? Color(0xff08131E):Color(0xffFDFDFD)

                ),
              ),
            ),
            spaceWithHeight(8),
            Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: unitController,

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Net Quantity",
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          14.0),
                    ),
                    spaceWithHeight(8),
                    Text(
                      "Net Total",
                      style: customisedStyleBold(
                          context, Color(0xff057030), FontWeight.w400, 14.0),
                    ),
                  ],
                ),
                spaceWithWidth(30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Net Quantity",
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          14.0),
                    ),
                    spaceWithHeight(8),
                    Text(
                      "New Total",
                      style: customisedStyleBold(
                          context, Color(0xff057030), FontWeight.w400, 14.0),
                    ),
                  ],
                ),
              ],
            ),
            spaceWithHeight(8),
          ],
        ),
      ),
    );
  }

}
