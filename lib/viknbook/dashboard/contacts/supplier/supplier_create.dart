import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../app/modules/home/controllers/home_controller.dart';
import '../../../custom/common_used_alerts.dart';
import '../../../custom/global.dart';


class SupplierCreate extends StatefulWidget {
  @override
  State<SupplierCreate> createState() => _SupplierCreateState();
}

class _SupplierCreateState extends State<SupplierCreate> {
  HomeController themeChangeController = Get.put(HomeController());
  ValueNotifier<DateTime> fromDateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> refDateNotifier = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> purchaseDateValue = ValueNotifier(DateTime.now());
  TextEditingController customerNameController = TextEditingController();
  TextEditingController openingBalanceController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController workPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController webUrlController = TextEditingController();
  TextEditingController routeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController creditLimitController = TextEditingController();
  TextEditingController creditPeriodController = TextEditingController();
  TextEditingController cRNoController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController taxNoController = TextEditingController();
  TextEditingController taxTreatmentController = TextEditingController();
  TextEditingController accHolderNameController = TextEditingController();
  TextEditingController accNoController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController addressCityController = TextEditingController();
  TextEditingController addressPostalController = TextEditingController();
  TextEditingController addressCountryController = TextEditingController();
  TextEditingController addressStateController = TextEditingController();
  TextEditingController addressOfficeNoController = TextEditingController();
  TextEditingController addressMobileController = TextEditingController();
  TextEditingController shippingNameController = TextEditingController();
  TextEditingController shippingController = TextEditingController();
  TextEditingController shippingAddress1Controller = TextEditingController();
  TextEditingController shippingAddress2Controller = TextEditingController();
  TextEditingController shippingCityController = TextEditingController();
  TextEditingController shippingPostalController = TextEditingController();
  TextEditingController shippingCountryController = TextEditingController();
  TextEditingController shippingStateController = TextEditingController();
  TextEditingController shippingOfficeNoController = TextEditingController();
  TextEditingController shippingMobileController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyy");

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
          "New Supplier",
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
            ///  Get.to(ContactDetailPage());
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
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: customerNameController,
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: TextFieldStyle.textFieldType(context,
                    hintTextStr: "Supplier Name",
                    labelTextStr: "Supplier Name"),
              ),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: displayNameController,
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: TextFieldStyle.textFieldType(context,
                    hintTextStr: "Display Name",
                    labelTextStr: "Display Name"),
              ),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15),
            child: Container(
              height: MediaQuery.of(context).size.height / 20,
              child: TextField(
                controller: openingBalanceController,
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Color(0xff000000),
                    FontWeight.w400,
                    15.0),
                decoration: TextFieldStyle.textFieldType(context,
                    hintTextStr: "Opening Balance",
                    labelTextStr:"Opening Balance"),
              ),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 80.0, right: 80),
            child: Container(
              width: MediaQuery.of(context).size.width/2.3,
              decoration: BoxDecoration(
                  color: themeChangeController.isDarkMode.value
                      ? Color(0xff1B2B30)
                      : Color(0xffEEF9FF),
                  borderRadius: BorderRadius.circular(12)),
              child: ValueListenableBuilder(
                  valueListenable: purchaseDateValue,
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
                            Text(
                              "As of. ",
                              style: customisedStyleBold(
                                  context,
                                  Color(0xff5B5B5B),
                                  FontWeight.w400,
                                  15.0),
                            ),
                            SvgPicture.asset(
                              "assets/svg/calendar.svg",
                              width: MediaQuery.of(context).size.width /
                                  20,
                              height:
                              MediaQuery.of(context).size.height /
                                  35,
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
          ),
          spaceWithWidth(8),
          Container(

            child: ExpansionTile(

              title: Row(
                children: [
                  Text(
                    "Other Details",
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        FontWeight.w500,
                        14.0),
                  ),
                  spaceWithWidth(8),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color:themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_sharp,
                color:Colors.transparent,
              ),
              children: <Widget>[
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: firstNameController,
                        // focusNode: fName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(lName);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,hintTextStr: "First Name",labelTextStr: "First Name")),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: lastNameController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Last Name",
                          labelTextStr: "Last Name",)),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        controller: workPhoneController,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(email);
                        // },
                        decoration: TextFieldStyle.textFieldType(
                          context,
                          hintTextStr:"Work Phone",
                          labelTextStr: "Work Phone",
                        )),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        // focusNode: email,
                        onEditingComplete: () {
                          bool emailValid =
                          RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(emailController.text);

                          if (emailValid == true) {
                            // FocusScope.of(context).requestFocus(url);
                          } else {
                          }
                        },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Email Address",
                          labelTextStr:  "Email Address",)),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: webUrlController,
                        // focusNode: email,
                        onEditingComplete: () {

                        },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Web URL",
                          labelTextStr:  "Web URL",)),
                  ),
                ),
                spaceWithHeight(8),

              ],
            ),
          ),


          spaceWithHeight(8),
          Container(

            child: ExpansionTile(

              title: Row(
                children: [
                  Text(
                    "Transactions",
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        FontWeight.w500,
                        14.0),
                  ),
                  spaceWithWidth(8),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color:themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_sharp,
                color:Colors.transparent,
              ),
              children: <Widget>[
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: routeController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Route",labelTextStr: "Route")),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,

                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: priceController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Price Category",labelTextStr: "Price Category")),
                      ),
                    ],
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: creditPeriodController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Credit Period",labelTextStr: "Credit Period")),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,

                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: creditLimitController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Credit Limit",labelTextStr: "Credit Limit")),
                      ),
                    ],
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: cRNoController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "CR No",labelTextStr: "CR No")),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,

                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: panNumberController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "PAN Number",labelTextStr: "PAN Number")),
                      ),
                    ],
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: taxNoController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "GST No",labelTextStr: "GST No")),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/2.3,

                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            textCapitalization: TextCapitalization.words,
                            keyboardType: TextInputType.text,
                            controller: taxTreatmentController,
                            // focusNode: fName,
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(lName);
                            // },
                            decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Tax Treatment",labelTextStr: "Tax Treatment")),
                      ),
                    ],
                  ),
                ),
                spaceWithHeight(8),
              ],
            ),
          ),

          spaceWithHeight(8),
          Container(

            child: ExpansionTile(

              title: Row(
                children: [
                  Text(
                    "Banks",
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        FontWeight.w500,
                        14.0),
                  ),
                  spaceWithWidth(8),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color:themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_sharp,
                color:Colors.transparent,
              ),
              children: <Widget>[
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: bankNameController,
                        // focusNode: fName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(lName);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Bank Name",labelTextStr: "Bank Name")),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: accHolderNameController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Account Holder Name",
                          labelTextStr:"Account Holder Name",)),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 2.3,

                        child: TextField(
                            controller:accNoController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(email);
                            // },
                            decoration: TextFieldStyle.textFieldType(
                              context,
                              hintTextStr:"Account No",
                              labelTextStr: "Account No",
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.3,

                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                            controller: ifscController,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: true, signed: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            // onEditingComplete: () {
                            //   FocusScope.of(context).requestFocus(email);
                            // },
                            decoration: TextFieldStyle.textFieldType(
                              context,
                              hintTextStr:"IBAN/IFSC",
                              labelTextStr: "IBAN/IFSC",
                            )),
                      ),
                    ],
                  ),
                ),
                spaceWithHeight(8),



              ],
            ),
          ),
          ///constraint box
          DividerStyle(),
          TextButton(onPressed: (){}, child: Text("Add Bank",style:customisedStyleBold(
              context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),
          spaceWithHeight(8),

          Container(

            child: ExpansionTile(

              title: Row(
                children: [
                  Text(
                    "Address",
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        FontWeight.w500,
                        14.0),
                  ),
                  spaceWithWidth(8),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color:themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_sharp,
                color:Colors.transparent,
              ),
              children: <Widget>[
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressNameController,
                        // focusNode: fName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(lName);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Name",labelTextStr: "Name")),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: address1Controller,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Address 1",
                          labelTextStr:"Address 1",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: address2Controller,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Address 2",
                          labelTextStr:"Address 2",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressCityController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "City",
                          labelTextStr:"City",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressPostalController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Postal Code",
                          labelTextStr:"Postal Code",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressCountryController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldWithIcon(context,
                          hintTextStr: "Country",
                          labelText:"Country",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressStateController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "State",
                          labelTextStr:"State",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressOfficeNoController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Office No",
                          labelTextStr:"Office No",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: addressMobileController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Mobile",
                          labelTextStr:"Mobile",)),
                  ),
                ),
                spaceWithHeight(8),




              ],
            ),
          ),

          spaceWithHeight(8),
          Container(

            child: ExpansionTile(

              title: Row(
                children: [
                  Text(
                    "Shipping Address",
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                        FontWeight.w500,
                        14.0),
                  ),
                  spaceWithWidth(8),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color:themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                  ),
                ],
              ),
              trailing: TextButton(onPressed: (){}, child: Text("Copy Address",style:customisedStyleBold(
                  context, Color(0xff0A9EF3), FontWeight.w500, 14.0),)),
              children: <Widget>[
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingNameController,
                        // focusNode: fName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(lName);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,hintTextStr: "Name",labelTextStr: "Name")),
                  ),
                ),
                spaceWithHeight(8),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingAddress1Controller,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Address 1",
                          labelTextStr:"Address 1",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingAddress2Controller,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Address 2",
                          labelTextStr:"Address 2",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingCityController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "City",
                          labelTextStr:"City",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingPostalController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Postal Code",
                          labelTextStr:"Postal Code",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingCountryController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldWithIcon(context,
                          hintTextStr: "Country",
                          labelText:"Country",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingStateController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "State",
                          labelTextStr:"State",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingOfficeNoController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Office No",
                          labelTextStr:"Office No",)),
                  ),
                ),
                spaceWithHeight(8),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    child: TextField(
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        controller: shippingMobileController,
                        // focusNode: lName,
                        // onEditingComplete: () {
                        //   FocusScope.of(context).requestFocus(phone);
                        // },
                        decoration: TextFieldStyle.textFieldType(context,
                          hintTextStr: "Mobile",
                          labelTextStr:"Mobile",)),
                  ),
                ),
                spaceWithHeight(8),




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
                    onTap: () {
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
            padding: EdgeInsets.only(
                left: 15.0,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom),
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
                        hintTextStr: "Add Note", labelTextStr: "Add Note"),
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
}
