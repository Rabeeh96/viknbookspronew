import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../custom/common_used_alerts.dart';
import '../../custom/global.dart';
import '../purchase/detail/add_customer.dart';
import 'detail/add_products.dart';

class SalesInvoice extends StatefulWidget {
  @override
  State<SalesInvoice> createState() => _SalesInvoiceState();
}

class _SalesInvoiceState extends State<SalesInvoice> {
  HomeController themeChangeController = Get.put(HomeController());
  ValueNotifier<DateTime> fromDateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> saleDateNotifier = ValueNotifier(DateTime.now());
  DateFormat dateFormat = DateFormat("dd/MM/yyy");
TextEditingController noteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    List colors = [
      themeChangeController.isDarkMode.value
          ? Color(0xff153344)
          : Color(0xffE6E6E6),
      themeChangeController.isDarkMode.value
          ? Color(0xff000000)
          : Color(0xffffffff),
    ];
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
          "New Sales Estimate",
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
            onTap: () {


            },
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: '#',
                          style: customisedStyleBold(context,
                              const Color(0xff55718C), FontWeight.w400, 12.0)),
                      TextSpan(
                          text: 'SE-345567 ',
                          style: customisedStyleBold(
                              context,
                              themeChangeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                              FontWeight.w400,
                              12.0)),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      // width: MediaQuery.of(context).size.width / 2.3,
                      child: ValueListenableBuilder(
                          valueListenable: saleDateNotifier,
                          builder: (BuildContext ctx, purchaseDateValue, _) {
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
                                      dateFormat.format(purchaseDateValue),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: SvgPicture.asset(
                        "assets/svg/edit_pen.svg",
                        width: MediaQuery.of(context).size.width / 20,
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(

            padding:
                const EdgeInsets.only(top: 8, left: 15.0, right: 15, bottom: 8),
            child: Container(
              height: MediaQuery.of(context).size.height / 18,
              decoration: BoxDecoration(
                gradient: themeChangeController.isDarkMode.value
                    ?const LinearGradient(colors: [
                  Color(0xff1C3347),
                  Color(0xff1C3347),
                ]

                ):LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.4,
                      0.1,

                    ],
                    colors: [
                  Color(0xffFFFFE9),
                  Color(0xffFFFFff),
                  Color(0xffFF8FEFF),

                ]

                ),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff1C3347)
                          : Color(0xffE7E7E7))),
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: GestureDetector(
                  onTap: () {
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
                          return bottomSheet();
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Customer",
                              style: customisedStyleBold(context,
                                  Color(0xff8C8C8C), FontWeight.w400, 14.0)),
                          spaceWithWidth(8),
                          Text("Cash in hand",
                              style: customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value
                                      ? Colors.white
                                      : Color(0xff000000),
                                  FontWeight.w400,
                                  14.0)),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddCustomer()),
                            );
                          },
                          icon: Icon(
                            Icons.navigate_next_outlined,
                            color: themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Color(0xff000000),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 15.0, right: 15, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProducts()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff08131E)
                          : Color(0xffF6F6F6),
                    ),
                    width: MediaQuery.of(context).size.width / 1.3,
                    child:  ListTile(
                      title: Text("Add Product"),
                      trailing:SvgPicture.asset("assets/svg/add.svg")
                    ),
                  ),
                ),
                GestureDetector(
                  child: SvgPicture.asset('assets/svg/barcode.svg'),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500, minHeight: 30),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 14,
                    color: (index % 2 == 0)
                        ? themeChangeController.isDarkMode.value
                            ? Color(0xff000000)
                            : Color(0xffffffff)
                        : themeChangeController.isDarkMode.value
                            ? Color(0xff153344)
                            : Color(0xffE6E6E6),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: customisedStyleBold(context,
                                    Color(0xff0A9EF3), FontWeight.w400, 14.0),
                              ),
                              Text(
                                "Unit",
                                style: customisedStyleBold(context,
                                    Color(0xff09C9C9C), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  //  style: TextStyle(color: Colors.black, fontSize: 36),

                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '23 ',
                                        style: customisedStyleBold(
                                            context,
                                            themeChangeController
                                                    .isDarkMode.value
                                                ? Colors.white
                                                : Colors.black,
                                            FontWeight.w400,
                                            14.0)),
                                    TextSpan(
                                        text: 'qty X SAR ',
                                        style: customisedStyleBold(
                                            context,
                                            Color(0xff9C9C9C),
                                            FontWeight.w400,
                                            14.0)),
                                    TextSpan(
                                        text: '12.00',
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
                                "Unit",
                                style: customisedStyleBold(context,
                                    Color(0xff09C9C9C), FontWeight.w400, 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Net Total",
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          14.0),
                    ),
                    spaceWithHeight(8),
                    Text(
                      "Grand Total",
                      style: customisedStyleBold(
                          context, Color(0xff057030), FontWeight.w400, 14.0),
                    ),
                  ],
                ),
                spaceWithWidth(30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Net Total",
                      style: customisedStyleBold(
                          context,
                          themeChangeController.isDarkMode.value
                              ? Colors.white
                              : Color(0xff000000),
                          FontWeight.w400,
                          14.0),
                    ),
                    spaceWithHeight(8),
                    Text(
                      "Grand Total",
                      style: customisedStyleBold(
                          context, Color(0xff057030), FontWeight.w400, 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          spaceWithHeight(8),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 12,
        child: Column(
          children: [
            DividerStyle(),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TextField(
                    onTap: (){
                      showModalBottomSheet(
                          isDismissible: true,
                          isScrollControlled: true,

                          context: context,
                          builder: (_) {
                            return addNote();
                          });
                    },
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    readOnly: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(6),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(
                              width: .5,
                              color: themeChangeController.isDarkMode.value
                                  ? Color(0xff1C3347)
                                  : Color(0xffE7E7E7)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(27)),
                          borderSide: BorderSide(
                              width: .5,
                              color: themeChangeController.isDarkMode.value
                                  ? Color(0xff1C3347)
                                  : Color(0xffE7E7E7)),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            'assets/svg/note-favorite.svg',
                          ),
                        ),
                        labelText: "Add Note",
                        labelStyle: customisedStyleBold(
                            context, Color(0xffAEAEAE), FontWeight.w500, 15.0),
                        hintText: "Add Note",
                        hintStyle: customisedStyleBold(
                            context, Color(0xffAEAEAE), FontWeight.w500, 15.0),
                        filled: true,
                        fillColor: themeChangeController.isDarkMode.value
                            ? Color(0xff08131E)
                            : Color(0xffFDFDFD)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
  Widget addNote() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
      return SingleChildScrollView(

        child: Container(
          child: Padding(

            padding:  EdgeInsets.only(left: 15.0,right: 15,bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                spaceWithHeight(15),

                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: TextField(
                    controller: noteController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Add Note",
                        labelTextStr: "Add Note"),
                  ),
                ),
                spaceWithHeight(15),


              ],
            ),
          ),
        ),
      );
    });
  }

  Widget bottomSheet() {
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
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Column(
              children: [
                spaceWithHeight(10),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
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
                      hintTextStr: "Vat Treatment",
                      labelTextStr: "Vat Treatment",
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
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
                      hintTextStr: "Place of Supply",
                      labelTextStr: "Place of Supply",
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  decoration: BoxDecoration(
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff08131E)
                          : Color(0xffF9F9F9),
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: TextField(
                          readOnly: true,
                          style: customisedStyleBold(
                              context,
                              themeChangeController.isDarkMode.value
                                  ? Colors.white
                                  : Color(0xff000000),
                              FontWeight.w400,
                              15.0),
                          decoration: TextFieldStyle.textFieldType(
                            context,
                            hintTextStr: "Expiry date",
                            labelTextStr: "Expiry date",
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: ValueListenableBuilder(
                            valueListenable: fromDateNotifier,
                            builder: (BuildContext ctx, fromDateNewValue, _) {
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
                                            themeChangeController
                                                    .isDarkMode.value
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
                  height: MediaQuery.of(context).size.height / 20,
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
                      hintTextStr: "Payment Through",
                      labelTextStr: "Payment Through",
                    ),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: MediaQuery.of(context).size.height/19,

                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff0E74F4),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: customisedStyleBold(
                            context, Colors.white, FontWeight.w400, 13.0),
                      )),
                ),
                spaceWithHeight(10),
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: MediaQuery.of(context).size.height/19,

                  child: TextButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddCustomer()),
                        );
                      },
                      child: Text(
                        "Change Customer",
                        style: customisedStyleBold(
                            context, Color(0xff0E74F4), FontWeight.w400, 13.0),
                      )),
                ),
                spaceWithHeight(10),
              ],
            ),
          ),
        ),
      );
    });
  }
}
