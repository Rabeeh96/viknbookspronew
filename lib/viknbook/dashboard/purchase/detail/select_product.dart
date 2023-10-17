import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../custom/global.dart';
import '../../../custom/search_common_class.dart';

class SelectProduct extends StatefulWidget {
  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController inclusiveController = TextEditingController();

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
          "Add Products",
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
                  "Add",
                  style: customisedStyleBold(
                      context, Color(0xff0A9EF3), FontWeight.w500, 16.0),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          spaceWithHeight(8),
          SearchFieldWidget(
            autoFocus: false,
            mHeight: mHeight,
            hintText: 'Search',
            controller: searchController,
            onChanged: (quary) async {
            },
          ),
          spaceWithHeight(8),



          Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: ListView.builder(
                // the number of items in the list
                  itemCount: 6,
                  // display each item of the product list
                  itemBuilder: (context, index) {
                    return  ExpansionTile(
                        iconColor: Colors.transparent,
                        trailing: const SizedBox.shrink(),
                        title: Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height / 17,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          "Product Name",
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                  .isDarkMode.value
                                                  ? Color(0xffE8E8E8)
                                                  : Color(0xff1C3347),
                                              FontWeight.w400,
                                              14.0),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            //  style: TextStyle(color: Colors.black, fontSize: 36),

                                            children: <TextSpan>[

                                              TextSpan(
                                                  text: '45 ',
                                                  style: customisedStyleBold(
                                                      context,
                                                      themeChangeController
                                                          .isDarkMode.value
                                                          ? Colors.white
                                                          : Colors.black,
                                                      FontWeight.w400,
                                                      12.0)),
                                              TextSpan(
                                                  text: 'Box',
                                                  style: customisedStyleBold(
                                                      context,
                                                      const Color(0xff7d7d7d),
                                                      FontWeight.w400,
                                                      12.0)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: themeChangeController
                                                    .isDarkMode.value
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 36),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'SAR ',
                                                  style: customisedStyleBold(
                                                      context,
                                                      const Color(0xff8F8F8F),
                                                      FontWeight.w400,
                                                      14.0)),
                                              TextSpan(
                                                  text: '2,78,000.00 ',
                                                  style: customisedStyleBold(
                                                      context,
                                                      Color(0xff0FBA20),
                                                      FontWeight.w400,
                                                      14.0)),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: themeChangeController
                                                    .isDarkMode.value
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontSize: 36),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Adding ',
                                                  style: customisedStyleBold(
                                                      context,
                                                      const Color(0xff1B83E3),
                                                      FontWeight.w400,
                                                      14.0)),
                                              TextSpan(
                                                  text: '45 ',
                                                  style: customisedStyleBold(
                                                      context,
                                                      themeChangeController
                                                          .isDarkMode.value
                                                          ? Colors.white
                                                          : Colors.black,
                                                      FontWeight.w400,
                                                      12.0)),
                                              TextSpan(
                                                  text: 'Box',
                                                  style: customisedStyleBold(
                                                      context,
                                                      const Color(0xff7d7d7d),
                                                      FontWeight.w400,
                                                      12.0)),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            DividerStyle()
                          ],
                        ),
                        // Contents
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              //   color: Repository.bottomSheet(context),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(25.0),
                                  topLeft: Radius.circular(25.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0,right: 15),
                              child: Column(
                                children: [
                                  spaceWithHeight(10),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height / 20,
                                        width: MediaQuery.of(context).size.width / 2.3,
                                        child: TextField(
                                          controller: unitController
                                          ,
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Color(0xff000000),
                                              FontWeight.w400,
                                              15.0),
                                          decoration: TextFieldStyle.textFieldType(context,
                                              hintTextStr: "Unit",
                                              labelTextStr: "Unit"),
                                        ),
                                      ),
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
                                            child:SvgPicture.asset("assets/svg/add.svg"),
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
                                          controller: qtyController,
                                        ),
                                      ),

                                    ],
                                  ),
                                  spaceWithHeight(8),
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
                                  ),
                                  spaceWithHeight(10),
                                  spaceWithHeight(10),

                                ],
                              ),
                            ),
                          )]);
                  })),


        ],
      ),
    );
  }


}



