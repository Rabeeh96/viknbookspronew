import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../custom/global.dart';
import 'dash_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'organization/organization_list.dart';

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
      appBar: AppBar(
   backgroundColor: Get.isDarkMode? Color(0xff1C3347):Color(0xffFFFFFF),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/svg/edit.svg'),color: Get.isDarkMode? Color(0xff1C3347):Color(0xffFFFFFF),),
        title: Text(
          "Dashboard ",
          style:  customisedStyleBold(context,  Get.isDarkMode?Colors.black:Colors.white, FontWeight.w500, 16.0),
        ),
        titleSpacing: 0,
        elevation: 0,
        actions: [


          IconButton(

              onPressed: () {
                setState(() {

                });
                print("Get.isDarkMode");
                print(Get.isDarkMode);
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              icon: Get.isDarkMode?Icon(Icons.light_mode,color: Colors.red,):Icon(Icons.dark_mode,color:  Colors.yellow,)),
          IconButton(

              onPressed: () {
                print("Get.isDarkMode");
                print(Get.isDarkMode);
              },
              icon: SvgPicture.asset(
                "assets/svg/notification-bing.svg",
                width: 15.75,
                height: 15.75,color: Get.isDarkMode? Color(0xffFFFFFF):Color(0xff1C3347),
              )),
          IconButton(

              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/search-normal.svg",
                width: 15.75,
                height: 15.75,color:Get.isDarkMode? Color(0xffFFFFFF):Color(0xff1C3347),
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
                return OrganizationPage();
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
        decoration:  BoxDecoration(
            color:Get.isDarkMode? Color(0xffFFFFFF):Color(0xff1C3347),
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

                            child: Column(
                              children: [
                                spaceWithHeight(5),

                                SvgPicture.asset(
                                  'assets/svg/menu_dash.svg',
                                  color: tabIndex.value == 1
                                      ? Color(0xff0A9EF3)
                                      : Color(0xffBEBEBE),
                                  height: 17,
                                  width: 17,
                                ),
                                spaceWithHeight(2),

                                Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      color: tabIndex.value == 1
                                          ? Color(0xff0A9EF3)
                                          : Color(0xffBEBEBE)),
                                ),
                                spaceWithHeight(5),
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

                            child: Column(
                              children: [
                                spaceWithHeight(5),

                                SvgPicture.asset(
                                  'assets/svg/menu_dash2.svg',
                                  color: tabIndex.value == 2
                                      ? Color(0xff0A9EF3)
                                      : Color(0xffBEBEBE),
                                  height:17,
                                  width: 17,
                                ),
                                spaceWithHeight(2),

                                Text(
                                  "Daybook",
                                  style: TextStyle(
                                      color: tabIndex.value == 2
                                          ? Color(0xff0A9EF3)
                                          : Color(0xffBEBEBE)),
                                ),
                                spaceWithHeight(5),

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

                              child: Column(
                                children: [
                                  spaceWithHeight(5),

                                  SvgPicture.asset(
                                    'assets/svg/report-analytics.svg',
                                    color: tabIndex.value == 3
                                        ? Color(0xff0A9EF3)
                                        : Color(0xffBEBEBE),
                                    height:17,
                                    width: 17,
                                  ),
                                  spaceWithHeight(2),

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

                              child: Column(
                                children: [
                                  spaceWithHeight(5),

                                  SvgPicture.asset(
                                    'assets/svg/Person.svg',
                                    color: tabIndex.value == 4
                                        ? Color(0xff0A9EF3)
                                        : Color(0xffBEBEBE),
                                    height:17,
                                    width: 17,
                                  ),
                                  spaceWithHeight(2),

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
                  )
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0A9EF3),
        elevation: 0,
       shape:     CircleBorder(),
        onPressed: () {},
        child: IconButton(
            icon: SvgPicture.asset(
              "assets/svg/favorite.svg",
              height: 19,
              width: 19,
            ),
            onPressed: () {

            }),
      ),

    );

  }
}
