import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'dart:developer';

import '../../../../app/modules/home/controllers/home_controller.dart';
import '../../../custom/global.dart';

class ContactDetailPage extends StatefulWidget {
  // String? masterType;
  // String? masterID;
  //DetailPage({super.key,required this.masterID,required this.masterType});

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  int status = 1;
  String text = 'assets/svg/paidIcon.svg';

  var voucherNo = "";
  var customerName = "Savad farooque";
  var cash_amount_received = "0.00";
  var bank_amount_received = "0.00";
  var discount_amount = "0.00";
  var per = "0.00";
  var dateText = "";
  var grand_total = "0.00";
  var gross_amount = "0.00";
  var total_tax = "0.00";
  var net_total = "0.00";
  var notes = "";
  var type = "";
  var place_of_supply = "";
  var reference_bill_number = "";
  var reference_bill_date = "";
  var notesVisibility = false;
  var statusShow = false;
  var statusWidth = 1.1;

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
          "Details",
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
              onPressed: () {},
              icon: SvgPicture.asset("assets/svg/delete.svg")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: build_body(),
      ),
    );
  }

  Widget build_body() {
    return RefreshIndicator(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              color: themeChangeController.isDarkMode.value
                  ? Color(0xff08131E)
                  : Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Card(
              color: themeChangeController.isDarkMode.value
                  ? Color(0xff08131E)
                  : Color(0xffF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11), // <-- Radius
              ),
              elevation: 0.0,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            customerName,
                            style: customisedStyleBold(context,
                                Color(0xffA1A1A1), FontWeight.w400, 16.0),
                          ),
                          SvgPicture.asset('assets/svg/edits.svg')
                        ],
                      ),
                      spaceWithHeight(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("savadfarooque@gmail.com",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff7D7D7D),
                                      FontWeight.w400,
                                      11.0)),
                              Text("+91 88384 09375",
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      12.0)),
                              spaceWithHeight(7),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/svg/call-calling.svg"),
                                  SvgPicture.asset("assets/svg/send.svg"),
                                  SvgPicture.asset("assets/svg/chat.svg"),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("outstanding receivable",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff7D7D7D),
                                      FontWeight.w400,
                                      11.0)),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color:
                                          themeChangeController.isDarkMode.value
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
                                            12.0)),
                                    TextSpan(
                                        text: '2,78,000.00 ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            12.0)),
                                  ],
                                ),
                              ),
                              Text("unused credits",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff7D7D7D),
                                      FontWeight.w400,
                                      11.0)),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color:
                                          themeChangeController.isDarkMode.value
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
                                            12.0)),
                                    TextSpan(
                                        text: '2,78,000.00 ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            12.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax No',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        'Tax No',
                        style: customisedStyleBold(
                            context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax Treatment',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        "Tax Treatment",
                        style: customisedStyleBold(
                            context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Route',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        "Route",
                        style: customisedStyleBold(
                            context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price Category',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        'Price Category',
                        style: customisedStyleBold(
                            context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          DividerStyle(),
          ExpansionTile(
            title: Text(
              "Price Category",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),
            ],
          ),
          spaceWithHeight(8),
          ExpansionTile(
            title: Text(
              "Sales Return ",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),

            ],
          ),
          spaceWithHeight(8),

          ExpansionTile(
            title: Text(
              "Purchase Invoice",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),

            ],
          ),
          spaceWithHeight(8),
          ExpansionTile(
            title: Text(
              "Purchase Return",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),

            ],
          ),
          spaceWithHeight(8),
          ExpansionTile(
            title: Text(
              "Payment",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),

            ],
          ),
          spaceWithHeight(8),

          ExpansionTile(

            title: Text(
              "Receipt",
              style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w500,
                  14.0),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
            children: <Widget>[
              Container(
                height: 100,
                child:ConstrainedBox(constraints: BoxConstraints(minHeight: 10,maxHeight: 1200),
                  child:  ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "# Invoice No",
                                  style: customisedStyleBold(context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black, FontWeight.w400, 14.0),
                                ),
                                Text(
                                  "DD/MM/YY",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff787878),
                                      FontWeight.w400,
                                      14.0),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                    children: <TextSpan>[

                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              Color(0xff9C9C9C),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '12.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController.isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: customisedStyleBold(context,
                                      Color(0xff09C9C9C), FontWeight.w400, 14.0),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("See all",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),

            ],
          ),
          ///
        ],
      ),
      onRefresh: () {
        return Future.delayed(Duration.zero, () {});
      },
    );
  }
}
