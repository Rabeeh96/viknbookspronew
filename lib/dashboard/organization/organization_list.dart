import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom/global.dart';

class OrganizationPage extends StatefulWidget{
  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Get.isDarkMode? Color(0xffFFFFFF):Color(0xff1C3347),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),color: Get.isDarkMode? Color(0xff1C3347):Color(0xffFFFFFF),),
      title: Text(
        "Organization ",
        style:  customisedStyleBold(context,  Get.isDarkMode?Colors.black:Colors.white, FontWeight.w500, 16.0),
      ),
      titleSpacing: 0,
      elevation: 0,
      actions: [


      ],
    ),
    body: ListView(
      children: [
        const Divider(
          color: Color(0xffE8E8E8),
          thickness: .5,
        ),
    ListView.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(),
          Text("Fossa Solution PVT LTD",style: customisedStyleBold(context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0),)
        ],
      ),
    );
    }),
    


      ],
    ),
  );
  }
}