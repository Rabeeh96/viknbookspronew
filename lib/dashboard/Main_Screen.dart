import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import '../custom/global.dart';
import 'dash_page.dart';

class ViknBooksMainScreen extends StatefulWidget {
  const ViknBooksMainScreen({Key? key}) : super(key: key);

  @override
  State<ViknBooksMainScreen> createState() => _ViknBooksMainScreenState();
}

class _ViknBooksMainScreenState extends State<ViknBooksMainScreen> {

  ValueNotifier<int> tabIndex = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/svg/edit.svg')),
        title: Text(
          "Dashboard ",
          style:
              customisedStyleBold(context, Colors.black, FontWeight.w500, 16.0),
        ),
        titleSpacing: 0,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/light.svg",
                width: 15.75,
                height: 15.75,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/notification-bing.svg",
                width: 15.75,
                height: 15.75,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/search-normal.svg",
                width: 15.75,
                height: 15.75,
              )),
        ],
      ),
      body: ValueListenableBuilder<int>(
          valueListenable: tabIndex,
          builder: (context, value, child) {
            switch (value) {
              case 1:
                return DashboardPage();
              case 2:
                return Container(child: Text("2"));
              case 3:
                return Container(child: Text("3"));
              case 4:
                return Container(child: Text("4"));
              case 5:
                return Container(child: Text("5"));
              default:
                return Container();
            }
          }),
      bottomNavigationBar: Container(
        height: mHeight * .08,
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            border: Border(top: BorderSide(color: Color(0xffC8C8C8)))),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ValueListenableBuilder<int>(
            valueListenable: tabIndex,
            builder: (context, color, child) {
              return Container(
                decoration: const BoxDecoration(),
                height:
                    MediaQuery.of(context).size.height / 18, //height of button
                width: MediaQuery.of(context).size.width / 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex.value = 1;
                            print("1111111111");
                          });
                        },
                        child: FittedBox(
                          child: Container(
                            width: mWidth * .16,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: tabIndex.value == 1
                                      ? Color(0xff0A9EF3)
                                      : Colors.transparent,
                                  width: 4,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/dashboard-reference.svg',
                                  color: tabIndex.value == 1
                                      ? Color(0xff0A9EF3)
                                      : Color(0xffBEBEBE),
                                  height: mHeight * .030,
                                  width: mWidth * .030,
                                ),
                                Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      color: tabIndex.value == 1
                                          ? Color(0xff0A9EF3)
                                          : Color(0xffBEBEBE)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex.value = 2;
                            print("1111111111");
                          });
                        },
                        child: FittedBox(
                          child: Container(
                            width: mWidth * .16,
                            decoration: BoxDecoration(
                              //  borderRadius: BorderRadius.circular(25.0),

                              border: Border(
                                bottom: BorderSide(
                                  color: tabIndex.value == 2
                                      ? Color(0xff0A9EF3)
                                      : Colors.transparent,
                                  width: 4,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/book.svg',
                                  color: tabIndex.value == 2
                                      ? Color(0xff0A9EF3)
                                      : Color(0xffBEBEBE),
                                  height: mHeight * .030,
                                  width: mWidth * .030,
                                ),
                                Text(
                                  "Daybook",
                                  style: TextStyle(
                                      color: tabIndex.value == 2
                                          ? Color(0xff0A9EF3)
                                          : Color(0xffBEBEBE)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabIndex.value = 3;
                              print("1111111111");
                            });
                          },
                          child: FittedBox(
                            child: Container(
                              width: mWidth * .16,
                              decoration: BoxDecoration(
                                //  borderRadius: BorderRadius.circular(25.0),

                                border: Border(
                                  bottom: BorderSide(
                                    color: tabIndex.value == 3
                                        ? Color(0xff0A9EF3)
                                        : Colors.transparent,
                                    width: 4,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/list(1).svg',
                                    color: tabIndex.value == 3
                                        ? Color(0xff0A9EF3)
                                        : Color(0xffBEBEBE),
                                    height: mHeight * .030,
                                    width: mWidth * .030,
                                  ),
                                  Text(
                                    "Menu",
                                    style: TextStyle(
                                        color: tabIndex.value == 3
                                            ? Color(0xff0A9EF3)
                                            : Color(0xffBEBEBE)),
                                  )
                                ],
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              tabIndex.value = 4;
                              print("1111111111");
                            });
                          },
                          child: FittedBox(
                            child: Container(
                              width: mWidth * .16,
                              decoration: BoxDecoration(
                                //  borderRadius: BorderRadius.circular(25.0),

                                border: Border(
                                  bottom: BorderSide(
                                    color: tabIndex.value == 4
                                        ? Color(0xff0A9EF3)
                                        : Colors.transparent,
                                    width: 4,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/report(1).svg',
                                    color: tabIndex.value == 4
                                        ? Color(0xff0A9EF3)
                                        : Color(0xffBEBEBE),
                                    height: mHeight * .030,
                                    width: mWidth * .030,
                                  ),
                                  Text(
                                    "Report",
                                    style: TextStyle(
                                        color: tabIndex.value == 4
                                            ? Color(0xff0A9EF3)
                                            : Color(0xffBEBEBE)),
                                  )
                                ],
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabIndex.value = 5;
                            print("1111111111");
                          });
                        },
                        child: Row(
                          children: [
                            FittedBox(
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(25.0),

                                      ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/Blank.svg',
                                        height: mHeight * .030,
                                        width: mWidth * .030,
                                      ),
                                      Text("")
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xff0A9EF3),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          onPressed: () {},
          label: IconButton(
              icon: SvgPicture.asset(
                "assets/svg/favorite.svg",
                height: 22,
                width: 25,
              ),
              onPressed: () {
                setState(() {
                  // print("herer");
                  // dashIndex = 4;
                  // bottomBarColor(dashIndex);
                });
              }),
        ),
      ),
    );

  }
}
