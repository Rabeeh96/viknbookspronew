import 'package:flutter/material.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom/global.dart';

class NewPayment extends StatefulWidget {
  @override
  State<NewPayment> createState() => _NewPaymentState();
}

class _NewPaymentState extends State<NewPayment> {
  HomeController themeChangeController = Get.put(HomeController());
  String fromPayment = "Cash in hand";
  bool isMultipleLedger = false;

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
          "New Payment",
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
      body: isMultipleLedger == true
          ? ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMultipleLedger = false;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: mWidth * .005,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: .2,
                              color: themeChangeController.isDarkMode.value
                                  ? Color(0xffE8E8E8)
                                  : Color(0xff1C3347)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff0A9EF3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )),
                          spaceWithWidth(7),
                          Text(
                            "Multiple Ledgers",
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
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: themeChangeController.isDarkMode.value

                            ///    #, #FFFFFF00
                            ? LinearGradient(colors: [
                                Color(0xff1C3347),
                                Color(0xff08131E),
                              ])
                            : LinearGradient(
                                colors: [Color(0xffE6E6E6), Color(0xffFFFFFF)]),
                        border: Border.all(
                            width: .2,
                            color: themeChangeController.isDarkMode.value
                                ? Color(0xff1C3347)
                                : Color(0xffE7E7E7)),
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/arrow-down-to-dot.svg"),
                                    spaceWithWidth(8),
                                    Text("From",
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff8C8C8C),
                                            FontWeight.w400,
                                            14.0)),
                                    spaceWithWidth(8),
                                    Text(fromPayment,
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Color(0xff000000),
                                            FontWeight.w400,
                                            14.0)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.navigate_next_outlined,
                                      color:
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Color(0xff000000),
                                    ))
                              ],
                            ),
                          ),
                          DividerStyle(),
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/arrow-down-up-dot.svg"),
                                    spaceWithWidth(8),
                                    Text("To     ",
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff8C8C8C),
                                            FontWeight.w400,
                                            14.0)),
                                    spaceWithWidth(8),
                                    Text(fromPayment,
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Color(0xff000000),
                                            FontWeight.w400,
                                            14.0)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        isDismissible: true,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            // <-- SEE HERE
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0),
                                            ),
                                          ),
                                          context: context,
                                          builder: (_) {
                                            return paymentBottomsheet();
                                          });

                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Color(0xff0A9EF3),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                spaceWithHeight(10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#PAY-345567",
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w500,
                            19.0),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/calendar.svg"),
                          spaceWithWidth(6),
                          Text(
                            "12/09/2023",
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w500,
                                14.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                spaceWithHeight(8),
                DividerStyle(),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 13,
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff153344)
                      : Color(0xffE6E6E6),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ledger Name",
                                  style: customisedStyleBold(context,
                                      Color(0xff0A9EF3), FontWeight.w400, 14.0),
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
                                          text: 'Due. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
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
                                          text: 'Discount. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Paying SAR. 1243.00",
                                  style: customisedStyleBold(context,
                                      Color(0xff029471), FontWeight.w400, 12.0),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 13,
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff000000)
                      : Color(0xffffffff),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ledger Name",
                                  style: customisedStyleBold(context,
                                      Color(0xff0A9EF3), FontWeight.w400, 14.0),
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
                                          text: 'Due. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
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
                                          text: 'Discount. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Paying SAR. 1243.00",
                                  style: customisedStyleBold(context,
                                      Color(0xff029471), FontWeight.w400, 12.0),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 13,
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff153344)
                      : Color(0xffE6E6E6),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ledger Name",
                                  style: customisedStyleBold(context,
                                      Color(0xff0A9EF3), FontWeight.w400, 14.0),
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
                                          text: 'Due. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
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
                                          text: 'Discount. ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff0A9EF3),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: 'SAR ',
                                          style: customisedStyleBold(
                                              context,
                                              const Color(0xff8F8F8F),
                                              FontWeight.w400,
                                              14.0)),
                                      TextSpan(
                                          text: '2,78,000.00',
                                          style: customisedStyleBold(
                                              context,
                                              themeChangeController
                                                      .isDarkMode.value
                                                  ? Colors.white
                                                  : Colors.black,
                                              FontWeight.w400,
                                              14.0)),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Paying SAR. 1243.00",
                                  style: customisedStyleBold(context,
                                      Color(0xff029471), FontWeight.w400, 12.0),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 120, right: 120),
                  child: GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 22,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: themeChangeController.isDarkMode.value
                              ? Color(0xff1B2B30)
                              : Color(0xffEAFAFF)),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/note-favorite.svg'),
                              spaceWithWidth(5),
                              Text("Add Note",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff0A9EF3),
                                      FontWeight.w400,
                                      12.0)),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMultipleLedger = true;
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: mWidth * .005,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: .2,
                              color: themeChangeController.isDarkMode.value
                                  ? Color(0xffE8E8E8)
                                  : Color(0xff1C3347)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: themeChangeController.isDarkMode.value
                                ? Color(0xff14304c)
                                : Color(0xfff4f4f4),
                          ),
                          Text(
                            "Multiple Ledgers",
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
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        gradient: themeChangeController.isDarkMode.value

                            ///    #, #FFFFFF00
                            ? LinearGradient(colors: [
                                Color(0xff1C3347),
                                Color(0xff08131E),
                              ])
                            : LinearGradient(
                                colors: [Color(0xffE6E6E6), Color(0xffFFFFFF)]),
                        border: Border.all(
                            width: .2,
                            color: themeChangeController.isDarkMode.value
                                ? Color(0xff1C3347)
                                : Color(0xffE7E7E7)),
                        borderRadius: BorderRadius.circular(11)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/arrow-down-to-dot.svg"),
                                    spaceWithWidth(8),
                                    Text("From",
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff8C8C8C),
                                            FontWeight.w400,
                                            14.0)),
                                    spaceWithWidth(8),
                                    Text(fromPayment,
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Color(0xff000000),
                                            FontWeight.w400,
                                            14.0)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.navigate_next_outlined,
                                      color:
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Color(0xff000000),
                                    ))
                              ],
                            ),
                          ),
                          DividerStyle(),
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/arrow-down-up-dot.svg"),
                                    spaceWithWidth(8),
                                    Text("To     ",
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff8C8C8C),
                                            FontWeight.w400,
                                            14.0)),
                                    spaceWithWidth(8),
                                    Text(fromPayment,
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Color(0xff000000),
                                            FontWeight.w400,
                                            14.0)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.navigate_next_outlined,
                                      color:
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Color(0xff000000),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                spaceWithHeight(12),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#PAY-345567",
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w500,
                            19.0),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/calendar.svg"),
                          spaceWithWidth(6),
                          Text(
                            "12/09/2023",
                            style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w500,
                                14.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                spaceWithHeight(10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 22,
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: TextField(
                          style: customisedStyleBold(
                              context,
                              themeChangeController.isDarkMode.value
                                  ? Colors.white
                                  : Color(0xff000000),
                              FontWeight.w400,
                              15.0),
                          decoration: TextFieldStyle.textFieldType(context,
                              hintTextStr: "Total Amount",
                              labelTextStr: "Total Amount"),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27),
                            color: themeChangeController.isDarkMode.value
                                ? Color(0xff1B2B30)
                                : Color(0xffEAFAFF)),
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Split evenly",
                                style: customisedStyleBold(context,
                                    Color(0xff0A9EF3), FontWeight.w400, 12.0))),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 22,
                    child: TextField(
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          15.0),
                      decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Discount", labelTextStr: "Discount"),
                    ),
                  ),
                ),
                spaceWithHeight(8),
                DividerStyle(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        //  style: TextStyle(color: Colors.black, fontSize: 36),

                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '#',
                                              style: customisedStyleBold(
                                                  context,
                                                  const Color(0xff7d7d7d),
                                                  FontWeight.w400,
                                                  12.0)),
                                          TextSpan(
                                              text: 'INV-42455 ',
                                              style: customisedStyleBold(
                                                  context,
                                                  themeChangeController
                                                          .isDarkMode.value
                                                      ? Colors.white
                                                      : Colors.black,
                                                  FontWeight.w400,
                                                  12.0)),
                                          TextSpan(
                                              text: '. Sale Invoice',
                                              style: customisedStyleBold(
                                                  context,
                                                  const Color(0xff0A9EF3),
                                                  FontWeight.w400,
                                                  12.0)),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "26/09/2023",
                                      style: customisedStyleBold(
                                          context,
                                          Color(0xffA6A6A6),
                                          FontWeight.w400,
                                          14.0),
                                    )
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
                                              text: 'SAR. ',
                                              style: customisedStyleBold(
                                                  context,
                                                  const Color(0xff8F8F8F),
                                                  FontWeight.w400,
                                                  14.0)),
                                          TextSpan(
                                              text: '2,78,000.00',
                                              style: customisedStyleBold(
                                                  context,
                                                  themeChangeController
                                                          .isDarkMode.value
                                                      ? Colors.white
                                                      : Colors.black,
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
                                              text: 'Due: ',
                                              style: customisedStyleBold(
                                                  context,
                                                  const Color(0xff0A9EF3),
                                                  FontWeight.w400,
                                                  14.0)),
                                          TextSpan(
                                              text: 'SAR. ',
                                              style: customisedStyleBold(
                                                  context,
                                                  const Color(0xff8F8F8F),
                                                  FontWeight.w400,
                                                  14.0)),
                                          TextSpan(
                                              text: '2,78,000.00',
                                              style: customisedStyleBold(
                                                  context,
                                                  themeChangeController
                                                          .isDarkMode.value
                                                      ? Colors.white
                                                      : Colors.black,
                                                  FontWeight.w400,
                                                  14.0)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          spaceWithHeight(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 22,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: TextField(
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Color(0xff000000),
                                      FontWeight.w400,
                                      15.0),
                                  decoration: TextFieldStyle.textFieldType(
                                      context,
                                      hintTextStr: "Amount",
                                      labelTextStr: "Amount"),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                    color:
                                        themeChangeController.isDarkMode.value
                                            ? Color(0xff1B2B30)
                                            : Color(0xffEAFAFF)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("Pay Full",
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff0A9EF3),
                                            FontWeight.w400,
                                            12.0))),
                              )
                            ],
                          ),
                          spaceWithHeight(5),
                        ],
                      )
                    ],
                  ),
                ),
                spaceWithHeight(5),
                Container(
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff08131E)
                      : Color(0xffFDFDFD),
                  height: MediaQuery.of(context).size.height / 12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  //  style: TextStyle(color: Colors.black, fontSize: 36),

                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '#',
                                        style: customisedStyleBold(
                                            context,
                                            const Color(0xff7d7d7d),
                                            FontWeight.w400,
                                            12.0)),
                                    TextSpan(
                                        text: 'INV-42455 - ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            12.0)),
                                    TextSpan(
                                        text: '26/09/2023',
                                        style: customisedStyleBold(
                                            context,
                                            const Color(0xffA6A6A6),
                                            FontWeight.w400,
                                            12.0)),
                                  ],
                                ),
                              ),
                              Text(
                                "Sale Invoice",
                                style: customisedStyleBold(context,
                                    Color(0xff0A9EF3), FontWeight.w400, 14.0),
                              ),
                              Text(
                                "",
                                style: customisedStyleBold(context,
                                    Color(0xff1662A9), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                                      text: 'SAR. ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00',
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
                                      text: 'Due: ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff0A9EF3),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: 'SAR. ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00',
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          13.0)),
                                ],
                              ),
                            ),
                            Text(
                              "Paying SAR. 1243.00",
                              style: customisedStyleBold(context,
                                  Color(0xff029471), FontWeight.w400, 12.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff000000)
                      : Color(0xffFfffff),
                  height: MediaQuery.of(context).size.height / 12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  //  style: TextStyle(color: Colors.black, fontSize: 36),

                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '#',
                                        style: customisedStyleBold(
                                            context,
                                            const Color(0xff7d7d7d),
                                            FontWeight.w400,
                                            12.0)),
                                    TextSpan(
                                        text: 'INV-42455 - ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            12.0)),
                                    TextSpan(
                                        text: '26/09/2023',
                                        style: customisedStyleBold(
                                            context,
                                            const Color(0xffA6A6A6),
                                            FontWeight.w400,
                                            12.0)),
                                  ],
                                ),
                              ),
                              Text(
                                "Sale Invoice",
                                style: customisedStyleBold(context,
                                    Color(0xff0A9EF3), FontWeight.w400, 14.0),
                              ),
                              Text(
                                "",
                                style: customisedStyleBold(context,
                                    Color(0xff1662A9), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                                      text: 'SAR. ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00',
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
                                      text: 'Due: ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff0A9EF3),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: 'SAR. ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00',
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          13.0)),
                                ],
                              ),
                            ),
                            Text(
                              "Paying SAR. 1243.00",
                              style: customisedStyleBold(context,
                                  Color(0xff029471), FontWeight.w400, 12.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 22,
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextField(
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          15.0),
                      decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Ref No", labelTextStr: "Ref No"),
                    ),
                  ),
                ),
                spaceWithHeight(10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 22,
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: TextField(
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          15.0),
                      decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Payment through",
                          labelTextStr: "Payment through"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 8, left: 120, right: 120),
                  child: GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 22,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: themeChangeController.isDarkMode.value
                              ? Color(0xff1B2B30)
                              : Color(0xffEAFAFF)),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/svg/note-favorite.svg'),
                              spaceWithWidth(5),
                              Text("Add Note",
                                  style: customisedStyleBold(
                                      context,
                                      Color(0xff0A9EF3),
                                      FontWeight.w400,
                                      12.0)),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
      bottomNavigationBar: isMultipleLedger == true
          ? Container(
              height: MediaQuery.of(context).size.height / 13,
              color: themeChangeController.isDarkMode.value
                  ? Colors.black
                  : Colors.white,
              child: Column(
                children: [
                  DividerStyle(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: themeChangeController.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Total ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff029471),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'SAR. ',
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: '2,78,000.00',
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
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height / 13,
              color: themeChangeController.isDarkMode.value
                  ? Colors.black
                  : Colors.white,
              child: Column(
                children: [
                  DividerStyle(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: themeChangeController.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'SAR. ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
                                      FontWeight.w400,
                                      12.0)),
                              TextSpan(
                                  text: '2,78,000.00',
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      16.0)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: themeChangeController.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 36),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Balance ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'SAR. ',
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: '2,78,000.00',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget paymentBottomsheet() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
      return SingleChildScrollView(
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ledger Name",style:  customisedStyleBold(
                context,
                themeChangeController
                    .isDarkMode.value
                    ? Colors.white
                    : Colors.black,
                FontWeight.w400,
                16.0)),
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
                                  text: 'Due. ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff0A9EF3),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'SAR ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: '2,78,000.00',
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController
                                          .isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      14.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/svg/add.svg"))
                  ],
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                  child: TextField(
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Amount",
                        labelTextStr: "Amount"),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                  child: TextField(
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Discount",
                        labelTextStr: "Discount"),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                  child: TextField(
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Reference No",
                        labelTextStr: "Reference No"),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                  child: TextField(
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Payment Through",
                        labelTextStr: "Payment Through"),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 22,
                  child: TextField(
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Narration",
                        labelTextStr: "Narration"),
                  ),
                ),
                spaceWithHeight(8),
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
                          text: 'Total ',
                          style: customisedStyleBold(
                              context,
                              const Color(0xff029471),
                              FontWeight.w400,
                              14.0)),
                      TextSpan(
                          text: 'SAR. ',
                          style: customisedStyleBold(
                              context,
                              const Color(0xff8F8F8F),
                              FontWeight.w400,
                              14.0)),
                      TextSpan(
                          text: '2,78,000.00',
                          style: customisedStyleBold(
                              context,
                              themeChangeController
                                  .isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                              FontWeight.w400,
                              14.0)),
                    ],
                  ),
                ),
                spaceWithHeight(10),
                spaceWithHeight(10),

              ],
            ),
          ),
        ),
      );
    });
  }
}
