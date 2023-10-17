import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/global.dart';



class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  HomeController themeChangeController = Get.put(HomeController());


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
          "Reports",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon:SvgPicture.asset("assets/svg/search.svg",color: Colors.black,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            spaceWithHeight(8),
            DividerStyle(),

            Container(
              color:themeChangeController.isDarkMode.value
                  ? Color(0xff08131E):Color(0xfff5f5f5),
              child: TextWidget(
                mHeight: mHeight,
                text: "Accounts",
              ),
            ),
            DividerStyle(),

            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Income & Expense",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),

            Container(
              color:themeChangeController.isDarkMode.value
                  ? Color(0xff08131E):Color(0xfff5f5f5),
              child: TextWidget(
                mHeight: mHeight,
                text: "Finance",
              ),
            ),            DividerStyle(),

            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trial Balance",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Profit and loss account",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Balance sheet",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Outstanding Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              color:themeChangeController.isDarkMode.value
                  ? Color(0xff08131E):Color(0xfff5f5f5),
              child: TextWidget(
                mHeight: mHeight,
                text: "Sales",
              ),
            ),            DividerStyle(),

            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sales Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sales Order Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sales Return Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              color:themeChangeController.isDarkMode.value
                  ? Color(0xff08131E):Color(0xfff5f5f5),
              child: TextWidget(
                mHeight: mHeight,
                text: "Purchase",
              ),
            ),            DividerStyle(),

            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Purchase Return Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Purchase Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
            Container(
              height: mHeight * .06,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Purchase Order Report",style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                          FontWeight.w400,
                          14.0),),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,),
                    ],
                  ),
                ),
              ),
            ),
            DividerStyle(),
          ],
        ),
      ),
    );
  }
}
