import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../app/modules/home/controllers/home_controller.dart';
HomeController themeChangeController = Get.put(HomeController());

customisedStyleBold(context,clr,fontWeight,fontSize){
  return GoogleFonts.poppins(textStyle:TextStyle(fontWeight: fontWeight,color: clr,fontSize: fontSize));
}
customisedStyle(context,clr, fontWeight,fontSize){
  return GoogleFonts.poppins(textStyle:TextStyle(fontWeight: fontWeight,color: clr,fontSize: fontSize));
}
Widget spaceWithHeight(double height){
  return SizedBox(
    height: height,
  );
}
Widget spaceWithWidth(double width){
  return SizedBox(
    width: width,
  );
}

Widget divider(double thick,Color color){
  return Divider(
    thickness: thick,
    color: color,

  );
}
class TextFieldStyle {

  static InputDecoration textFieldType(context,
      {String hintTextStr = "", String labelTextStr = ""}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(6),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
            ? Color(0xff1C3347):Color(0xffE7E7E7)
             ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
            ? Color(0xff1C3347):Color(0xffE7E7E7)),
      ),

      labelText: labelTextStr,
      labelStyle:  customisedStyleBold(
          context,
          Color(0xffAEAEAE),
          FontWeight.w500,
          15.0),

      hintText: hintTextStr,

  hintStyle: customisedStyleBold(
      context,
      Color(0xffAEAEAE),
      FontWeight.w500,
      15.0),
      filled: true,
      fillColor:themeChangeController.isDarkMode.value
          ? Color(0xff08131E):Color(0xffF9F9F9)

    );
  }

  static InputDecoration textFieldWithIcon(context,{String hintTextStr="",String labelText="",Color clr = Colors.black }){
    return InputDecoration(
      contentPadding: EdgeInsets.all(6),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: .5,color:  themeChangeController.isDarkMode.value
            ? Color(0xff1C3347):Color(0xffE7E7E7)
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: .5,color:   themeChangeController.isDarkMode.value
            ? Color(0xff1C3347):Color(0xffE7E7E7)),
      ),

      labelText: labelText,
      labelStyle:  customisedStyleBold(
          context,
          Color(0xffAEAEAE),
          FontWeight.w500,
          15.0),

      hintText: hintTextStr,

      hintStyle: customisedStyleBold(
          context,
          Color(0xffAEAEAE),
          FontWeight.w500,
          15.0),
      filled: true,
      fillColor:themeChangeController.isDarkMode.value
          ? Color(0xff08131E):Color(0xffF9F9F9),
      suffixIcon: Icon(Icons.keyboard_arrow_down,color: themeChangeController.isDarkMode.value
          ? Colors.white
          : Color(0xff000000),),

    );



  }

}
Widget DividerStyle(){
 // Color(0xffE8E8E8): Color(0xff1C3347)
  Color lightgrey = Color(0xFFE8E8E8);
  Color grey= Color(0xFFE8E8E8).withOpacity(.3);
//  themeChangeController.isDarkMode.value ? Color(0xffE8E8E8): Color(0xff1C3347)
  return Container(
    height: 1,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient:themeChangeController.isDarkMode.value ?  LinearGradient(colors: [
          Color(0xff1C3347).withOpacity(.3), // Transparent color
          Color(0xff1C3347), // Middle color
          Color(0xff1C3347).withOpacity(.3), // Transparent color
        ],
          stops: [0.1,0.4,1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            :LinearGradient(colors: [
          grey, // Transparent color
          lightgrey, // Middle color
          grey, // Transparent color
        ],
          stops: [0.1,0.4,1.0],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
    ),
  );
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.mHeight,
    required this.text,
  });

  final double mHeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    HomeController themeChangeController = Get.put(HomeController());

    return Container(
      height: mHeight * .06,
      child: Center(
        child: Text(
          text,
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w400,
              16.0),
        ),
      ),
    );
  }
}
