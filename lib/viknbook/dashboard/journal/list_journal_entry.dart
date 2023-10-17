import 'package:flutter/material.dart';


import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/common_used_alerts.dart';
import '../../custom/global.dart';
import '../../custom/search_common_class.dart';
import 'add_journal.dart';


class JournalList extends StatefulWidget {
  @override
  State<JournalList> createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  ValueNotifier<DateTime> fromDateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> toDateNotifier = ValueNotifier(DateTime.now());
  DateFormat dateFormat = DateFormat("dd/MM/yyy");

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
          "Journal Entries",
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddJournal()),
              );
            },
            icon:SvgPicture.asset("assets/svg/add.svg"),
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
              ///  filterSearchResults(searchController.text);
            },
          ),          spaceWithHeight(8),
          Container(
            height: MediaQuery.of(context).size.height / 19,


            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff1B2B30):Color(0xffEEF9FF),

                      borderRadius: BorderRadius.circular(24)),
                  child: ValueListenableBuilder(
                      valueListenable: fromDateNotifier,
                      builder:
                          (BuildContext ctx, fromDateNewValue, _) {
                        //    dateNewValue = apiDateFormat.format(dateTime).toString();

                        return GestureDetector(
                          onTap: () {
                            showDatePickerFunction(
                                context, fromDateNotifier);
                            //   dateNotifier = ValueNotifier( DateFormat().format(date);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [

                              SvgPicture.asset(
                              "assets/svg/calendar.svg",
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 35,
                            ),
                                spaceWithWidth(6),
                                Text(
                                  dateFormat.format(fromDateNewValue),
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Color(0xff000000),
                                      FontWeight.w400,
                                      15.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                spaceWithWidth(20),
                Container(
                  decoration: BoxDecoration(
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff1B2B30):Color(0xffEEF9FF),

                      borderRadius: BorderRadius.circular(24)),
                  child: ValueListenableBuilder(
                      valueListenable: toDateNotifier,
                      builder:
                          (BuildContext ctx, toDateNewValue, _) {
                        //    dateNewValue = apiDateFormat.format(dateTime).toString();

                        return GestureDetector(
                          onTap: () {
                            showDatePickerFunction(
                                context, toDateNotifier);
                            //   dateNotifier = ValueNotifier( DateFormat().format(date);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                              SvgPicture.asset(
                              "assets/svg/calendar.svg",
                              width: MediaQuery.of(context).size.width / 20,
                              height: MediaQuery.of(context).size.height / 35,
                            ),spaceWithWidth(6),
                                Text(
                                  dateFormat.format(toDateNewValue),
                                  style:customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Color(0xff000000),
                                      FontWeight.w400,
                                      15.0),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

              ],
            ),
          ),
          spaceWithHeight(8),
          Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: ListView.builder(
                  // the number of items in the list
                    itemCount: 6,

                    // display each item of the product list
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {

                          },
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height / 17,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    text: 'Invoice No  ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        themeChangeController
                                                            .isDarkMode
                                                            .value
                                                            ? Colors.white
                                                            : Colors.black,
                                                        FontWeight.w400,
                                                        12.0)),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "DD/MM/YY",
                                            style: customisedStyleBold(
                                                context,
                                                Color(0xff7D7D7D),
                                                FontWeight.w400,
                                                14.0),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "",

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
                                                    text: 'SAR. ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        const Color(0xff8F8F8F),
                                                        FontWeight.w400,
                                                        14.0)),
                                                TextSpan(
                                                    text: '2,78,000.00 ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        themeChangeController
                                                            .isDarkMode
                                                            .value
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
                                  )),
                              DividerStyle(),
                            ],
                          ));
                    }),
              )),
        ],
      ),
    );
  }
}
