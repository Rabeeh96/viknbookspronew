import 'package:flutter/material.dart';


import '../../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../custom/global.dart';
import '../../../custom/search_common_class.dart';

class AddCustomer extends StatefulWidget {
  @override
  State<AddCustomer> createState() => _addCustomerState();
}

class _addCustomerState extends State<AddCustomer> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController customerController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController freeQtyController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController inclusiveController = TextEditingController();
  TextEditingController taxTypeController = TextEditingController();

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
          "",
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
            Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: customerController,
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
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:   Icon(Icons.keyboard_arrow_down,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),),
                    ),
                    labelText: "Product",
                    labelStyle:  customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),

                    hintText: "Product",

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: qtyController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Quantity",
                        labelTextStr: "Quantity"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextField(
                    controller: freeQtyController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                      hintTextStr: "Free Quantity",
                      labelTextStr: "Free Quantity",),
                  ),
                ),
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
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:   Icon(Icons.keyboard_arrow_down,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),),
                    ),
                    labelText: "Unit",
                    labelStyle:  customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),

                    hintText: "Unit",

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
            ), spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,

                  child: TextField(
                    controller: priceController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Price",
                        labelTextStr: "Price"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.3,

                  child: TextField(
                    controller: inclusiveController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Inclusive",
                        labelTextStr: "Inclusive"),
                  ),
                ),
              ],
            ),spaceWithHeight(8),
            Container(
              height: MediaQuery.of(context).size.height / 20,
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
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347):Color(0xffE7E7E7)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:   Icon(Icons.keyboard_arrow_down,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),),
                    ),
                    labelText:  "Tax Type",
                    labelStyle:  customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),

                    hintText: "Tax Type",

                    hintStyle: customisedStyleBold(
                        context,
                        Color(0xffAEAEAE),
                        FontWeight.w500,
                        15.0),
                    filled: true,
                    fillColor:themeChangeController.isDarkMode.value
                        ? Color(0xff08131E):Color(0xffFDFDFD)

                ),
                controller: taxTypeController,
              ),
            ),spaceWithHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:

                  [

                    Text("Vat Amount", style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),),
                    Text("Vat Percentage", style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),), Text("Gross Amount", style: customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Color(0xff000000),
                      FontWeight.w400,
                      15.0),),
                    Text("Total Tax", style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),),
                    Text("Net Amount", style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),),

                  ],),
                spaceWithWidth(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Text("Vat Amount", style: customisedStyleBold(
                        context,
                        Color(0xff9F9F9F),
                        FontWeight.w400,
                        15.0),),
                    Text("Vat Percentage", style: customisedStyleBold(
                        context,
                        Color(0xff9F9F9F),
                        FontWeight.w400,
                        15.0),), Text("Gross Amount", style: customisedStyleBold(
                        context,
                        Color(0xff9F9F9F),
                        FontWeight.w400,
                        15.0),),
                    Text("Total Tax", style: customisedStyleBold(
                        context,
                        Color(0xff9F9F9F),
                        FontWeight.w400,
                        15.0),),
                    Text("Net Amount", style: customisedStyleBold(
                        context,
                        Color(0xff9F9F9F),
                        FontWeight.w400,
                        15.0),),

                  ],),
              ],
            ),


            spaceWithHeight(8),
          ],
        ),
      ),
    );
  }

}
