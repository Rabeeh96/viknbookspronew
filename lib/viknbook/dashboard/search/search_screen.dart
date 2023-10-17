import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import '../../custom/global.dart';
import 'package:get/get.dart';

///raz
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var items = ['customer', 'supplier'];

  String dropdownvalue = 'customer';
  HomeController themeChangeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                    FontWeight.w400,
                    16.0),
              ),
              Image.asset(
                'assets/new/Vector.png',
              ),
            ],
          ),
        ),
        body: Container(
            height: mHeight,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      height: 1, color: Color(0xffE2E2E2), width: mWidth * .99),
                  Container(
                    height: mHeight * .03,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: mWidth * .05, right: mWidth * .03),
                        hintText: 'Search',
                        hintStyle: customisedStyle(context, Color(0xffB4B4B4),
                            FontWeight.normal, 14.0),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xffB4B4B4),
                          ),
                        )),
                  ),
                  Container(
                      height: 1, color: Color(0xffE2E2E2), width: mWidth * .7),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  Container(
                      height: mHeight * .042,
                      width: mWidth * .35,
                      decoration: BoxDecoration(
                          color: const Color(0xffEEF9FF),
                          borderRadius: BorderRadius.circular(23)),
                      child: Container(
                        padding: EdgeInsets.only(left: mWidth * .065),
                        child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: dropdownvalue,
                          style: const TextStyle(
                              fontSize: 10,
                              color : Color(0xff818181),
                              fontWeight: FontWeight.w600),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff818181),
                                      FontWeight.w400,
                                      12.0)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {});
                            dropdownvalue = newValue.toString();
                          },
                        ),
                      )),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  Container(
                      height: 1, color: Color(0xffE2E2E2), width: mWidth * .7),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: mHeight * .1,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                  ),
                                  title: Text(
                                    "Savad Farooque",
                                    style: customisedStyleBold(
                                        context,
                                        themeChangeController.isDarkMode.value
                                            ? Colors.white
                                            : Colors.black,
                                        FontWeight.w400,
                                        12.0),
                                  ),
                                ),
                                Container(
                                    height: 1,
                                    color: Color(0xffE2E2E2),
                                    width: mWidth * .7),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            )));
  }
}
