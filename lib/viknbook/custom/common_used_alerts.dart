import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../app/modules/home/controllers/home_controller.dart';
import 'global.dart';

HomeController themeChangeController = Get.put(HomeController());

msgBtmDialogueFunction({required BuildContext context ,required String textMsg }) {
  return showModalBottomSheet(
    context: context,
//     isScrollControlled: true,
// isDismissible: false,
    enableDrag: false,
    builder: (BuildContext context) {
      return Container(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // color: Colors.blue,
                    width: MediaQuery.of(context).size.width*.7,
                    child: Text(textMsg,overflow:TextOverflow.fade,style:

                    customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),






                    )),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child:   Text("Okay",
                  style: TextStyle(color: Color(0xff0E74F4,),fontWeight: FontWeight.bold),)

                ),
              ],
            )
        ),
      );
    },
  );
}
DateTime dateTime =DateTime.now();
//  DateFormat dateFormat = DateFormat("dd/MM/yyy");
// DateFormat apiDateFormat = DateFormat("y-M-d");

late ValueNotifier<String> dateNotifier ;

showDatePickerFunction(context,ValueNotifier dateNotifier) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: mWidth * .98,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(left: mWidth * .13, top: mHeight * .01),
                  child:  Center(
                    child: Text(
                      "Select Date",
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          15.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CalendarDatePicker(
              onDateChanged: (selectedDate) {
                dateNotifier.value = selectedDate;
                Navigator.pop(context);
              },
              initialDate: DateTime.now(),
              firstDate: DateTime.now().add(
                const Duration(days: -100000000),
              ),
              lastDate: DateTime.now().add(const Duration(days: 6570)),
            ),
          ],
        ),
      ),
    ),
  );
}
start(context) {
  Loader.show(context,
      progressIndicator: CircularProgressIndicator(),
      overlayColor: Colors.transparent,
      themeData:
      ThemeData(colorScheme: ColorScheme.dark(primary: Colors.transparent)));
}
stop() {
  Future.delayed(Duration(seconds: 0), () {
    Loader.hide();
  });
}

btmDialogueFunction({required BuildContext context,required String textMsg,required Function() fistBtnOnPressed ,required Function() secondBtnPressed, required String secondBtnText,required bool isDismissible }) {
  return showModalBottomSheet(
    isDismissible: isDismissible,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height/9,

        child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(textMsg,style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),),
                SizedBox(width: MediaQuery.of(context).size.width*.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    TextButton(onPressed:fistBtnOnPressed,  child: const Text("Cancel",style: TextStyle(color: Colors.redAccent),)),
                    TextButton(onPressed: secondBtnPressed, child: Text(secondBtnText,style: const TextStyle(color: Colors.green),)),

                  ],
                ),

              ],
            )
        ),
      );
    },
  );
}
