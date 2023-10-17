import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/controller/theme_controller.dart';
import '../controllers/home_controller.dart';
import 'Test.dart';
class Test extends StatefulWidget{
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
 // HomeController controller = Get.put<HomeController>();
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Trial page"),
    ),
    body: Container(
      child: Column(
        children: [
          Text("they are very innecent",style: TextStyle(color: controller.isDarkMode.value==true?Colors.red:Colors.blue),),
          Text("i hope its ready"),
          Text("but i still have a doubt about it"),
          Text("they are very innecent"),
          Text("they are very innecent"),
          Text("they are very innecent"),
        ],
      ),
    ),
  );
  }
}