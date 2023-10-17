import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../app/modules/home/controllers/home_controller.dart';
import '../../../custom/common_used_alerts.dart';
import '../../../custom/global.dart';
import 'package:get/get.dart';

class PurchaseFilter extends StatefulWidget {
  const PurchaseFilter({Key? key}) : super(key: key);

  @override
  State<PurchaseFilter> createState() => _PurchaseFilterState();
}

class _PurchaseFilterState extends State<PurchaseFilter> {
  ValueNotifier<DateTime> fromDateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> toDateNotifier = ValueNotifier(DateTime.now());
  DateFormat dateFormat = DateFormat("dd/MM/yyy");
  DateFormat apiDateFormat = DateFormat("y-M-d");
  ValueNotifier<DateTime> fromDate = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> toDate = ValueNotifier(DateTime.now());
  ValueNotifier<int> buttonIndex = ValueNotifier(1);
  TextEditingController searchController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  HomeController themeChangeController = Get.put(HomeController());


  String dayDropDownValue = 'This Month';
  var days = [
    'This Month',
    'This Day',
    'This Week',
    'This Year',
  ];
  Color textPending=Colors.white;
  Color textInvoice=Colors.black;
  Color textCancelled=Colors.black;
  Color backPending=Color(0xff0E74F4);
  Color backInvoice=Color(0xff1B2B30);
  Color backCancelled=Color(0xff1B2B30);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectColor(1);
  }
  @override
  Widget build(BuildContext context) {

    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
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
          "Filter",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined,color: Color(0xff0E74F4),)),
                Text("Filter",style: customisedStyleBold(context,  Color(0xff0E74F4), FontWeight.w400, 14.0),),
              ],
            ),
          )
        ],

      ),
      body: Container(
        // padding: EdgeInsets.only(left: mWidth * .05, right: mWidth * .05),

        height: mHeight,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: mHeight * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 24,
                    decoration: BoxDecoration(
                        color:themeChangeController.isDarkMode.value

                            ?
                        Color(0xff1C3347):Color(0xffEBEBEB),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: DropdownButton(
                        underline: Container(
                          height: 0,
                        ),
                        icon: null,
                        value: dayDropDownValue,
                        items: days.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items + "",
                              style: customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value

                                      ? Colors.white
                                      : Colors.black,
                                  FontWeight.normal,
                                  11.0),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) async {
                          setState(() {
                            dayDropDownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              spaceWithHeight(8),
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

                                    const Icon(
                                      Icons.calendar_month,
                                      color: Color(0xff0A9EF3),
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
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Color(0xff0A9EF3),
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
              SizedBox(
                height: mHeight * .01,
              ),
              ValueListenableBuilder<int>(
                  valueListenable: buttonIndex,
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 22,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                                color: backPending, borderRadius: BorderRadius.circular(24)),
                            child: TextButton(
                                onPressed: () {
                                  buttonIndex.value = 1;
                                  selectColor(1);
                                },
                                child: Text(
                                  "Pending",
                                  style:
                                  customisedStyle(context, textPending , FontWeight.w500, 12.0),
                                ))),
                        Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: MediaQuery.of(context).size.height / 22,
                            decoration: BoxDecoration(
                                color:backInvoice, borderRadius: BorderRadius.circular(24)),
                            child: TextButton(
                                onPressed: () {
                                  buttonIndex.value = 2;
                                  selectColor(2);
                                },
                                child: Text(
                                  "Invoiced",
                                  style:
                                  customisedStyle(context, textInvoice , FontWeight.w500, 12.0),
                                ))),
                        Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: MediaQuery.of(context).size.height / 22,
                            decoration: BoxDecoration(
                                color: backCancelled, borderRadius: BorderRadius.circular(24)),
                            child: TextButton(
                                onPressed: () {
                                  buttonIndex.value = 3;
                                  selectColor(3);
                                },
                                child: Text(
                                  "Cancel",
                                  style:
                                  customisedStyle(context,textCancelled , FontWeight.w500, 12.0),
                                ))),
                      ],
                    );
                  }),

              spaceWithHeight(mHeight * .02),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                child: TextField(
                  onChanged: (text) {},
                  onTap: () {},
                  controller: searchController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(6),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        borderSide:
                        BorderSide(width: 1, color: Color(0xffCCCCCC)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        borderSide:
                        BorderSide(width: 1, color: Color(0xffCCCCCC)),
                      ),
                      suffixIcon:  Icon(
                        Icons.keyboard_arrow_down,
                        color:themeChangeController.isDarkMode.value
                            ? Colors.white:Colors.black,
                      ),
                      hintText: "Select Supplier",
                      hintStyle: customisedStyleBold(
                          context, const Color(0xffAEAEAE), FontWeight.normal, 12.0),
                      fillColor: themeChangeController.isDarkMode.value
                          ? Color(0xff08131E):Color(0xffFDFDFD),
                      filled: true),
                ),
              ),
              DividerStyle()


            ],
          ),
        ),
      ),
    );
  }

  selectColor(int value){
    if(themeChangeController.isDarkMode==true){
      if(value==1){
        textPending=Colors.white;
        textInvoice=Colors.white;
        textCancelled=Colors.white;
        backPending=Color(0xff0E74F4);
        backInvoice=Color(0xff1B2B30);
        backCancelled=Color(0xff1B2B30);
      }else if(value==2){
        textPending=Colors.white;
        textInvoice=Colors.white;
        textCancelled=Colors.white;
        backPending=Color(0xff1B2B30);
        backInvoice=Color(0xff0E74F4);
        backCancelled=Color(0xff1B2B30);
      }else{
        textPending=Colors.white;
        textInvoice=Colors.white;
        textCancelled=Colors.white;
        backPending=Color(0xff1B2B30);
        backInvoice=Color(0xff1B2B30);
        backCancelled=Color(0xff0E74F4);
      }
    }
    else

    {
      if(value==1){
        textPending=Colors.white;
        textInvoice=Colors.black;
        textCancelled=Colors.black;
        backPending=Color(0xff0E74F4);
        backInvoice=Color(0xffEEF9FF);
        backCancelled=Color(0xffEEF9FF);
      }else if(value==2){
        textPending=Colors.black;
        textInvoice=Colors.white;
        textCancelled=Colors.black;
        backPending=Color(0xffEEF9FF);
        backInvoice=Color(0xff0E74F4);
        backCancelled=Color(0xffEEF9FF);
      }else{
        textPending=Colors.black;
        textInvoice=Colors.black;
        textCancelled=Colors.white;
        backPending=Color(0xffEEF9FF);
        backInvoice=Color(0xffEEF9FF);
        backCancelled=Color(0xff0E74F4);
      }
    }
  }
}
