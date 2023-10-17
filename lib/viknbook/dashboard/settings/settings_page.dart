import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/global.dart';
import 'general_setting.dart';



class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
          "Settings",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            spaceWithHeight(8),


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
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/settings.svg"),


                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("General Settings",style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w400,
                                14.0),),
                          ),
                        ],
                      ),
                     IconButton(onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => SettingsPage()),
                       );

                     }, icon:  Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                         ? Colors.white
                         : Colors.black,size: 20,)),
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
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/user-2.svg",
                             ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("User",style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w400,
                                14.0),),
                          ),

                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,size: 20,),
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
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/user-cog.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Userrole",style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w400,
                                14.0),),
                          ),

                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,size: 20,),
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
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/git-branch.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Branches",style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w400,
                                14.0),),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,size: 20,),
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
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/list-numbers.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Transaction No",style: customisedStyleBold(
                                context,
                                themeChangeController.isDarkMode.value
                                    ? Colors.white
                                    : Colors.black,
                                FontWeight.w400,
                                14.0),),
                          ),
                        ],
                      ),

                      Icon(Icons.arrow_forward_ios,color:  themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,size: 20,),
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
