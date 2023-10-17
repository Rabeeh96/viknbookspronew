import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/global.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:http/http.dart' as http;

import 'detail/bom/add_bom.dart';
import 'detail/multi_unit.dart';
import 'detail/select_unit.dart';

class AddProduct extends StatefulWidget {
  bool? isEdit;


  AddProduct({
    super.key,

    required this.isEdit,

  });

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nameSecondController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController taxCategoryController = TextEditingController();
  TextEditingController unitNameController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController purPriceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  ValueNotifier<int> changeButtonIndex = ValueNotifier<int>(1);
  final _formKey = GlobalKey<FormState>();
bool isFav=false;
bool isRawMaterial=false;
bool isSale=false;
bool isPurchase=false;
bool isFinishedProduct=false;
bool isEdit=false;
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
        title:widget.isEdit==true?Text(
          "Edit Product",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ):
        Text(
          "Add Product",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  changeButtonIndex.value=3;
                });
              },
              child: Text(
                "Add Bom",
                style: customisedStyleBold(
                    context, Color(0xff0A9EF3), FontWeight.w400, 13.0),
              ),
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              child: Text(
                "Save",
                style: customisedStyleBold(
                    context, Color(0xff0A9EF3), FontWeight.w400, 13.0),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder<int>(
            valueListenable: changeButtonIndex,
            builder: (context, value, child) {
              switch (value) {
                case 1:
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 20,
                              child:   Row(
                                children: [
                                  Text("Status",style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w500,
                                      14.0),),
                                  spaceWithWidth(10),
                                  FlutterSwitch(
                                    width: 40.0,
                                    height: 20.0,
                                    valueFontSize: 30.0,
                                    toggleSize: 15.0,
                                    value: isFav,
                                    borderRadius: 20.0,
                                    padding: 1.0,
                                    activeColor: Colors.green,
                                    activeTextColor: Colors.green,
                                    //   inactiveTextColor: Repository.textColor(context),
                                    inactiveColor: Colors.grey,
                                    // showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        isFav = val;
                                      });



                                    },
                                  ),
                                ],
                              ),
                            ),
                            
                            Row(
                              children: [
                                SvgPicture.asset("assets/svg/heart-filled.svg"),
                                spaceWithWidth(8),
                                SvgPicture.asset("assets/svg/edit_pen.svg"),

                              ],
                            ),
                          ],
                        ),
                      ),
                      spaceWithHeight(8),
                      DividerStyle(),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey
                                    ),
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                height: 120,
                                width: 100,
                                child: SvgPicture.asset("assets/svg/add.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey
                                  ),
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: SvgPicture.asset("assets/svg/add.svg"),
                                height: 120,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      spaceWithHeight(8),
                      DividerStyle(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: productCodeController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,labelTextStr: "Product Code",hintTextStr: "Product code"),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: barcodeController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,labelTextStr: "BarCode",hintTextStr: "Barcode"),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: nameController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,labelTextStr: "Name",hintTextStr: "Name"),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Container(
                          height: MediaQuery.of(context).size.height / 22,

                          decoration: BoxDecoration(
                              color: themeChangeController.isDarkMode.value
                                  ? Color(0xff1B2B30)
                                  : Color(0xffEEF9FF),
                              borderRadius: BorderRadius.circular(27)),
                          child: TextButton(onPressed: (){}, child: Text("  Translate  "))),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: nameController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,labelTextStr: "Name",hintTextStr: "Name"),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: nameSecondController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,labelTextStr: "Name in 2nd Language",hintTextStr: "Name in 2nd Language"),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Container(
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width/1.1,
                        decoration: BoxDecoration(
                          gradient: themeChangeController.isDarkMode.value
                              ?LinearGradient(
                            colors: [


                              Color(0xff08131E00),
                              Color(0xff1C3347),
                              Color(0xff08131E00),
                            ]
                          ):LinearGradient(
                              colors: [
                                Color(0xffF8F8F8),
                                Color(0xffF8F8F8),

                              ]
                          )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description"),
                            Text("Rich Text Area"),
                          ],
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: brandController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,
                              hintTextStr: "Brand",
                              labelTextStr: "Brand",),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: groupController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,
                              hintTextStr: "Group",
                              labelTextStr: "Group",),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: taxCategoryController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,
                              hintTextStr: "Tax Category",
                              labelTextStr: "Tax Category",),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: unitNameController,
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                15.0),
                            decoration: TextFieldStyle.textFieldType(context,
                              hintTextStr: "Unit Name",
                              labelTextStr: "Unit Name",),
                          ),
                        ),
                      ),
                      spaceWithHeight(8),
                      DividerStyle(),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Sales Price 1",style:customisedStyleBold(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Sales Price 2",style:customisedStyleBold(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Sales Price 3",style:customisedStyleBold(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Container(
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
                      ),
                      spaceWithHeight(8),
                      GestureDetector(
                        onTap: () {
                          Get.to(AddMultiUnit());
                        },
                        child: Padding(
                            padding:
                            const EdgeInsets.only(left: 110, right: 110),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: themeChangeController.isDarkMode.value
                                      ? Color(0xff1B2B30)
                                      : Color(0xffEEF9FF),
                                  borderRadius: BorderRadius.circular(31)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset("assets/svg/add.svg"),
                                  ),
                                  spaceWithWidth(7),
                                  Text(
                                    "Add Barcode",
                                    style: customisedStyleBold(
                                        context,
                                        themeChangeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        FontWeight.w400,
                                        12.0),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      //constraint box
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Min stock",style:customisedStyleBold(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Max stock",style:customisedStyleBold(
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
                      ),
                      spaceWithHeight(8),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height /20,
                              width: MediaQuery.of(context).size.width / 2.3,
                              child:Text("Re order",style:customisedStyleBold(
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
                              Text("Raw Material",style:customisedStyleBold(
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
                                  value: isRawMaterial,
                                  borderRadius: 20.0,
                                  padding: 1.0,
                                  activeColor: Colors.green,
                                  activeTextColor: Colors.green,
                                  //   inactiveTextColor: Repository.textColor(context),
                                  inactiveColor: Colors.grey,
                                  // showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {
                                      isRawMaterial = val;
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
                              Text("Sales ",style:customisedStyleBold(
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
                                  value: isSale,
                                  borderRadius: 20.0,
                                  padding: 1.0,
                                  activeColor: Colors.green,
                                  activeTextColor: Colors.green,
                                  //   inactiveTextColor: Repository.textColor(context),
                                  inactiveColor: Colors.grey,
                                  // showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {
                                      isSale = val;
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
                              Text("Purchasse",style:customisedStyleBold(
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
                                  value: isPurchase,
                                  borderRadius: 20.0,
                                  padding: 1.0,
                                  activeColor: Colors.green,
                                  activeTextColor: Colors.green,
                                  //   inactiveTextColor: Repository.textColor(context),
                                  inactiveColor: Colors.grey,
                                  // showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {
                                      isPurchase = val;
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
                              Text("Finished Product",style:customisedStyleBold(
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
                                  value: isFinishedProduct,
                                  borderRadius: 20.0,
                                  padding: 1.0,
                                  activeColor: Colors.green,
                                  activeTextColor: Colors.green,
                                  //   inactiveTextColor: Repository.textColor(context),
                                  inactiveColor: Colors.grey,
                                  // showOnOff: true,
                                  onToggle: (val) {
                                    setState(() {
                                      isFinishedProduct = val;
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
                  );
                case 2:
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.35,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: ListView.builder(
                              // the number of items in the list
                              itemCount: 2,

                              // display each item of the product list
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                17,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "name",
                                                      style: customisedStyleBold(
                                                          context,
                                                          themeChangeController
                                                                  .isDarkMode
                                                                  .value
                                                              ? Color(
                                                                  0xffE8E8E8)
                                                              : Color(
                                                                  0xff1C3347),
                                                          FontWeight.w400,
                                                          13.0),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  'Sales Price ',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: 'SAR .',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: "1200",
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  themeChangeController
                                                                          .isDarkMode
                                                                          .value
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Barcode",
                                                      style: customisedStyleBold(
                                                          context,
                                                          themeChangeController
                                                                  .isDarkMode
                                                                  .value
                                                              ? Color(
                                                                  0xffE8E8E8)
                                                              : Color(
                                                                  0xff1C3347),
                                                          FontWeight.w400,
                                                          13.0),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  'Pur. Price ',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: 'SAR .',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: "1000",
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  themeChangeController
                                                                          .isDarkMode
                                                                          .value
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                        DividerStyle(),
                                      ],
                                    ));
                              }),
                        ),
                      ),
                      spaceWithHeight(8),
                      GestureDetector(
                        onTap: () {
                          Get.to(AddMultiUnit());
                        },
                        child: Padding(
                            padding:
                            const EdgeInsets.only(left: 110, right: 110),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: themeChangeController.isDarkMode.value
                                      ? Color(0xff1B2B30)
                                      : Color(0xffEEF9FF),
                                  borderRadius: BorderRadius.circular(31)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset("assets/svg/add.svg"),
                                  ),
                                  spaceWithWidth(7),
                                  Text(
                                    "Add Multi Units",
                                    style: customisedStyleBold(
                                        context,
                                        themeChangeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        FontWeight.w400,
                                        12.0),
                                  ),
                                ],
                              ),
                            )),
                      ),

                    ],
                  );
                case 3:
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.35,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: ListView.builder(
                            // the number of items in the list
                              itemCount: 2,

                              // display each item of the product list
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height /
                                                17,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "product name",
                                                      style: customisedStyleBold(
                                                          context,
                                                          themeChangeController
                                                              .isDarkMode
                                                              .value
                                                              ? Color(
                                                              0xffE8E8E8)
                                                              : Color(
                                                              0xff1C3347),
                                                          FontWeight.w400,
                                                          13.0),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                              'Sales Price ',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: 'SAR .',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: "1200",
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  themeChangeController
                                                                      .isDarkMode
                                                                      .value
                                                                      ? Colors
                                                                      .white
                                                                      : Colors
                                                                      .black,
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Barcode",
                                                      style: customisedStyleBold(
                                                          context,
                                                          themeChangeController
                                                              .isDarkMode
                                                              .value
                                                              ? Color(
                                                              0xffE8E8E8)
                                                              : Color(
                                                              0xff1C3347),
                                                          FontWeight.w400,
                                                          13.0),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                              'Pur. Price ',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: 'SAR .',
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                          TextSpan(
                                                              text: "1000",
                                                              style: customisedStyleBold(
                                                                  context,
                                                                  themeChangeController
                                                                      .isDarkMode
                                                                      .value
                                                                      ? Colors
                                                                      .white
                                                                      : Colors
                                                                      .black,
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                        DividerStyle(),
                                      ],
                                    ));
                              }),
                        ),
                      ),
                      spaceWithHeight(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Quantity",
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
                                "Grand Total",
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
                                "Total Quantity",
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
                                "Grand Total",
                                style: customisedStyleBold(
                                    context, Color(0xff057030), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      spaceWithHeight(8),
                      changeButtonIndex.value==3? GestureDetector(
                        onTap: () {
                          Get.to(AddBOM());
                        },
                        child: Padding(
                            padding:
                            const EdgeInsets.only(left: 110, right: 110),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: themeChangeController.isDarkMode.value
                                      ? Color(0xff1B2B30)
                                      : Color(0xffEEF9FF),
                                  borderRadius: BorderRadius.circular(31)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset("assets/svg/add.svg"),
                                  ),
                                  spaceWithWidth(7),
                                  Text(
                                    "Add BOM",
                                    style: customisedStyleBold(
                                        context,
                                        themeChangeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        FontWeight.w400,
                                        12.0),
                                  ),
                                ],
                              ),
                            )),
                      ):   GestureDetector(
                        onTap: () {
                          Get.to(AddMultiUnit());
                        },
                        child: Padding(
                            padding:
                            const EdgeInsets.only(left: 110, right: 110),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 25,
                              decoration: BoxDecoration(
                                  color: themeChangeController.isDarkMode.value
                                      ? Color(0xff1B2B30)
                                      : Color(0xffEEF9FF),
                                  borderRadius: BorderRadius.circular(31)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SvgPicture.asset("assets/svg/add.svg"),
                                  ),
                                  spaceWithWidth(7),
                                  Text(
                                    "Add Multi Units",
                                    style: customisedStyleBold(
                                        context,
                                        themeChangeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        FontWeight.w400,
                                        12.0),
                                  ),
                                ],
                              ),
                            )),
                      ),

                    ],
                  );
                default:
                  return Container();
              }
            }),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 14,
        child: ValueListenableBuilder<int>(
          valueListenable: changeButtonIndex,
          builder: (context, color, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,

                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeButtonIndex.value = 1;
                        print("1111111111");
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: changeButtonIndex.value == 1?5:1,

                              color: changeButtonIndex.value == 1
                              ? Color(0xff0A9EF3)
                              : Color(0xffE8E8E8),
                        )),
                        //  borderRadius: BorderRadius.circular(9)
                      ),
                      child: Center(
                          child: Text("Details",
                              style: customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value
                                      ? Colors.white
                                      : Color(0xff000000),
                                  FontWeight.w400,
                                  14.0))),
                    ),
                  ),
                ),
                changeButtonIndex.value ==3? Container(
                  width: MediaQuery.of(context).size.width / 2,

                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeButtonIndex.value = 3;
                      });
                      // selectIndex.value == 1 ? getTotalApi(0) : getTotalApi(1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: changeButtonIndex.value == 3?5:1,
                              color: changeButtonIndex.value == 3
                                  ? Color(0xff0A9EF3)
                                  : Color(0xffE8E8E8),
                            )),

                        // borderRadius: BorderRadius.circular(9)
                      ),
                      child: Center(
                          child:Text(
                            "BOM",
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Color(0xff000000),
                                FontWeight.w400,
                                14.0),
                          )),
                    ),
                  ),
                ): Container(
                  width: MediaQuery.of(context).size.width / 2,

                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeButtonIndex.value = 2;
                      });
                      // selectIndex.value == 1 ? getTotalApi(0) : getTotalApi(1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              width: changeButtonIndex.value == 2?5:1,
                          color: changeButtonIndex.value == 2
                              ? Color(0xff0A9EF3)
                              : Color(0xffE8E8E8),
                        )),

                        // borderRadius: BorderRadius.circular(9)
                      ),
                      child: Center(
                          child: Text(
                        "Multi-Units",
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Color(0xff000000),
                            FontWeight.w400,
                            14.0),
                      )),
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
