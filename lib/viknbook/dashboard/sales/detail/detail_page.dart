import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../custom/global.dart';

import 'package:http/http.dart' as http;

import 'dart:developer';

import '../../../../app/modules/home/controllers/home_controller.dart';
import '../../../custom/global.dart';

class DetailPage extends StatefulWidget {
  // String? masterType;
  // String? masterID;
  //DetailPage({super.key,required this.masterID,required this.masterType});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
              icon: SvgPicture.asset("assets/svg/printer.svg")),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/svg/share.svg")),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: build_body(),
      ),
      bottomNavigationBar: bottomBarDetail(),
    );
  }

  Widget build_body() {
    return RefreshIndicator(
      child: ListView(
        children: [
          paymentHistoryDetail(),
          paidAndInvoiceStatus(),
          DividerStyle(),
          referenceDetail(),
///constarint box remove container hgt
          Container(
            height: 200,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 500,minHeight: 30             ),
              child:ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    height: MediaQuery.of(context).size.height/13,
                    color:   (index % 2 == 0) ?themeChangeController.isDarkMode.value
                        ? Color(0xff000000)
                        : Color(0xffffffff): themeChangeController.isDarkMode.value
                        ? Color(0xff153344)
                        : Color(0xffE6E6E6),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 5,bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: customisedStyleBold(
                                    context, Color(0xff0A9EF3), FontWeight.w400, 14.0),
                              ),
                              Text(
                                "SAR 10.00 X 10 Pieces",
                                style: customisedStyleBold(
                                    context, themeChangeController.isDarkMode.value
                                    ? Color(0xffffffff)
                                    : Color(0xff000000), FontWeight.w400, 14.0),
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
                                        text: '23 ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController.isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            14.0)),
                                    TextSpan(
                                        text: 'qty X SAR ',
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
                                style: customisedStyleBold(
                                    context, Color(0xff09C9C9C), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  );},
              ),
            ),
          ),
          amountAndTaxDetails(),

        ],
      ),
      onRefresh: () {
        return Future.delayed(Duration.zero, () {});
      },
    );
  }

  Widget paymentDetail() {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // <-- Radius
          ),
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment details',
                    ),
                    Row(
                      children: [
                        Text(
                          'Cash :',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Bank :',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget paymentHistoryDetail() {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
        color: themeChangeController.isDarkMode.value
            ? Color(0xff08131E):Color(0xffF5F5F5)
        ,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Card(
        color: themeChangeController.isDarkMode.value
            ?  Color(0xff08131E):Color(0xffF5F5F5),
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
                      style: customisedStyleBold(
                          context, Color(0xffA1A1A1), FontWeight.w400, 16.0),
                    ),
                    SvgPicture.asset('assets/svg/edits.svg')
                  ],
                ),
                spaceWithHeight(5),
                RichText(
                  text: TextSpan(
                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(
                              context,
                              const Color(0xff7d7d7d),
                              FontWeight.w400,
                              12.0)),
                      TextSpan(
                          text: '0.00 ',
                          style: customisedStyleBold(
                              context,
                              themeChangeController.isDarkMode.value
                                  ? Colors.black
                                  : Colors.white,
                              FontWeight.w400,
                              12.0)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Color(0xffC80000),
                        ),
                        Text(
                          "Delete",
                          style: customisedStyleBold(context,
                              Color(0xffC80000), FontWeight.w400, 15.0),
                        )
                      ],
                    ),
                    Text("View History",
                        style: customisedStyleBold(context, Color(0xff0A9EF3),
                            FontWeight.w400, 15.0))
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget paidAndInvoiceStatus() {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            statusShow == true
                ? Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 7,
                    child: SvgPicture.asset(text),
                  )
                : Container(width: 1, height: 25, color: Colors.transparent),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Invoice No',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        '#Invoice No',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Invoice Date',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        "Payment Date",
                        style: customisedStyleBold(context, Color(0xffA1A1A1),
                            FontWeight.w400, 14.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Due Date',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ),
                      Text(
                        "Due Date",
                        style: customisedStyleBold(context, Color(0xffA1A1A1),
                            FontWeight.w400, 14.0),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget referenceDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' Reference No',
            ),
            Text(
              "02/12/2023",
            )
          ],
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Reference Date',style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w400,
                  14.0),
              ),
              Text(
                "20/10/2023",style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w400,
                  14.0),
              )
            ],
          ),
        ),

      ],
    );
  }

  Widget amountAndTaxDetails() {
    return Container(
      width: MediaQuery.of(context).size.width/1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column( crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Gross Amount",
                  style: customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                      FontWeight.w400,
                      14.0)
              ),
              Text(
                'Discount:',
               style: customisedStyleBold(
                  context,
                  themeChangeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  FontWeight.w400,
                  14.0)
              ),
              Text(
                "Grand Total",
                style: TextStyle(
                    color: Color(0xff1A9C01),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )

            ],
          ),
          spaceWithWidth(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Gross Amount",
                style: customisedStyleBold(context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
              ),
              Text(
                'Discount',
                style:customisedStyleBold(context, Color(0xffA1A1A1), FontWeight.w400, 14.0),
              ),
              Text(
                "Grand Total",
                style: TextStyle(
                    color: Color(0xff1A9C01),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )

            ],
          ),
        ],
      ),
    );
  }

  Widget bottomBarDetail() {
    return Container(
      height: MediaQuery.of(context).size.height/12,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            //                    <--- top side
            width: .5,
          ),
        ),
      ),
      //   height: MediaQuery.of(context).size.height/15,

      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notes',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  notes,
                ))
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }



}

