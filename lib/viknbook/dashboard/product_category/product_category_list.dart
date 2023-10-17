import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../api/api_suing_model_class/base.dart';
import '../../custom/common_used_alerts.dart';
import '../../custom/global.dart';
import '../../custom/search_common_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class ProductCategoryList extends StatefulWidget {
  @override
  State<ProductCategoryList> createState() => _ProductCategoryListState();
}

class _ProductCategoryListState extends State<ProductCategoryList> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getProductCategoryList();
  }
bool isEdit=false;

String? productUID;
  var netWorkProblem = true;
  bool isLoading = false;
  bool isList = false;
  var pageNumber = 1;
  var firstTime = 1;
  late int charLength;
  bool isSearch = false;
  bool searchIcon = false;
  bool networkConnection = true;

  Future _searchData(string) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var companyID = prefs.getString('companyID') ?? '';
    var userID = prefs.getInt('user_id') ?? 0;

    if (string == '') {
      pageNumber = 1;
      productCategoryList.clear();
      firstTime = 1;
      getProductCategoryList();
    } else if (string.length > 1) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        ///
      } else {
        try {
          Map data = {
            "BranchID": Base.branchId,
            "CompanyID": companyID,
            "CreatedUserID": userID,
            "PriceRounding": Base.priceRounding,
            "product_name": string,
            "length": 3
          };
          String baseUrl = Base.server;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var token = prefs.getString('access') ?? '';
          final String url =
              "$baseUrl/productCategories/search-productCategory-list/";
          print(data);
          var body = json.encode(data);
          var response = await http.post(Uri.parse(url),
              headers: {
                "Content-Type": "application/json",
                'Authorization': 'Bearer $token',
              },
              body: body);
          print("${response.statusCode}");
          print("${response.body}");
          Map n = json.decode(utf8.decode(response.bodyBytes));
          var status = n["StatusCode"];
          var responseJson = n["data"];
          var message = n["message"];
          print(responseJson);
          if (status == 6000) {


            productCategoryList.clear();

            setState(() {
              netWorkProblem = true;
              productCategoryList.clear();
              isLoading = false;
            });

            setState(() {
              for (Map user in responseJson) {
                productCategoryList.add(ProductCategoryModel.fromJson(user));
              }
            });
          } else if (status == 6001) {
            setState(() {
              netWorkProblem = true;
              isLoading = false;
            });

            ///
          } else {
          }
        } catch (e) {
          setState(() {
            netWorkProblem = false;
            isLoading = false;
          });

          print(e);
        }
      }

      /// call function
      return;
    } else {}
  }
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          "Product Category",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [


          IconButton(onPressed: (){
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
           return addProduct();
         });

   }, icon:SvgPicture.asset("assets/svg/add.svg"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            spaceWithHeight(8),
            SearchFieldWidget(
              autoFocus: false,
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
              onChanged: (quary) async {
                _searchData(searchController.text);
                },
            ),
            spaceWithHeight(8),
            SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15
                  ),
                  child: ListView.builder(
                    // the number of items in the list
                      itemCount: productCategoryList.length,
                      // display each item of the product list
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                          confirmDismiss: (DismissDirection direction) async {
                            return await btmDialogueFunction(
                                isDismissible: true,
                                context: context,
                                textMsg: 'Are you sure delete ?',
                                fistBtnOnPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                secondBtnPressed: () async {
                                  Navigator.of(context).pop(true);
                                  deleteItems(productCategoryList[index].uuid);                              },
                                secondBtnText: 'Delete');
                          },
                          key: Key('item ${[index]}'),
                          onDismissed: (direction) async {},
                          child: GestureDetector(
                            onTap: (){
                              getSingleView(productCategoryList[index].uuid);

                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(productCategoryList[index].categoryName,style:  customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w500,
                                      14.0),),
                                ),
                                DividerStyle()
                              ],
                            ),
                          ),
                        )
                        ///
                        ;
                      }),
                )),
          ],
        ),
      ),
    );
  }
  Widget addProduct() {
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

            padding:  EdgeInsets.only(left: 15.0,right: 15,bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                spaceWithHeight(15),

                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: TextField(
                    controller: nameController,
                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Name",
                        labelTextStr: "Name"),
                  ),
                ),
                spaceWithHeight(8),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: TextField(
                    controller: descriptionController,

                    style: customisedStyleBold(
                        context,
                        themeChangeController.isDarkMode.value
                            ? Colors.white
                            : Color(0xff000000),
                        FontWeight.w400,
                        15.0),
                    decoration: TextFieldStyle.textFieldType(context,
                        hintTextStr: "Description",
                        labelTextStr: "Description"),
                  ),
                ),
                spaceWithHeight(8),

                spaceWithHeight(8),
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: MediaQuery.of(context).size.height/19,

                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff0E74F4),
                        elevation: 0,
                      ),
                      onPressed: () {
                        if(nameController.text==''){
                          print("Please enter name");
                        }
                        else{
                          if(isEdit==true){
                            editProductCategory(productUID!);
                          }else{
                            createNewProduct(nameController.text,descriptionController.text);
                          }
                        }

                        clear();
                        Navigator.pop(context);
                      },
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

                      },
                      child: Text(
                        "Cancel",
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
  Future<Null> getProductCategoryList() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      stop();
    } else {
      try {
        start(context);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var branchID = Base.branchId;
        var userID = prefs.getInt('user_id') ?? 0;

        String baseUrl = Base.server;
        final String url = '$baseUrl/productCategories/productCategories/';

        var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        print(url);
        Map data = {
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "BranchID": 1,
          "CreatedUserID": 371
        };
        print(data);
        //encode Map to JSON
        var body = json.encode(data);

        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);

        Map n = json.decode(utf8.decode(response.bodyBytes));
        print(response.body);
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(responseJson);
        print(status);
        if (status == 6000) {
          setState(() {
            productCategoryList.clear();
            stop();
            for (Map user in responseJson) {
              productCategoryList.add(ProductCategoryModel.fromJson(user));
            }
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg: msg);


        }
        //DB Error
        else {
          stop();
        }
      } catch (e) {
        stop();
        msgBtmDialogueFunction(context: context, textMsg: e.toString());

      }
    }
  }

  Future<Null> deleteItems(String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        var companyID = prefs.getString('companyID') ?? '';
        var userID = 371;
        var uID = id;
        print(uID);
        String baseUrl = Base.server;
        final String url =
            '$baseUrl/productCategories/delete/productCategory/$uID/';
        print(url);

        Map data = {
          "CreatedUserID": 371,
          "CompanyID":  "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "BranchID": 1
        };
        print(data);

        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"]; //6000 status or messege is here
        var msgs = n["message"];
        print(msgs);
        print(response.body);

        print(status);
        if (status == 6000) {
          setState(() {
            productCategoryList.clear();
            stop();
            getProductCategoryList();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg:msg);

        } else {}
      } catch (e) {
          stop();
          msgBtmDialogueFunction(context: context, textMsg: e.toString());


      }
    }
  }
  Future<Null> createNewProduct(String name,String note) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        stop();
      });
    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt('user_id') ?? 0;


        var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        String baseUrl = Base.server;
        final String url = '$baseUrl/productCategories/create-productCategory/';

        print(url);

        Map data = {
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "BranchID": 1,
          "CreatedUserID": 371,
          "CategoryName":name,
          "Notes":note
        };
        print(data);

        //encode Map to JSON
        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        print(response.statusCode);
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        if (status == 6000) {
          setState(() {
            stop();
            getProductCategoryList();


          });
        } else if (status == 6001) {
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg: msg);

          stop();
        } else {}
      } catch (e) {
          stop();
          msgBtmDialogueFunction(context: context, textMsg: e.toString());

      }
    }
  }
  Future<Null> getSingleView(String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {

        stop();

    } else {
      try {


        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt('user_id') ?? 0;
        var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        String baseUrl = Base.server;
        var uID=id;
        productUID=id;
        final url = '$baseUrl/productCategories/view/productCategory/$uID/';
        print(url);
        Map data = {
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "BranchID":1,
          "BrandName":nameController.text,
          "Notes":descriptionController.text,
          "CreatedUserID":371
        };
        print(data);
        //encode Map to JSON
        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        print(response.statusCode);

        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];
        var responseJson = n["data"];
        print(status);
        if (status == 6000) {
          setState(() {
            stop();
            nameController.text = responseJson['ProductCategoryName'];
            descriptionController.text = responseJson['Notes'];
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
                  return addProduct();
                });

            setState(() {
              isEdit=true;
            });

          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg: msg);

        }
        //DB Error
        else {
          stop();
        }
      } catch (e) {
        msgBtmDialogueFunction(context: context, textMsg: e.toString());

      }
    }
  }
  Future<Null> editProductCategory(String id) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {

        stop();

    } else {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt('user_id') ?? 0;

        var branchID = Base.branchId;
        var accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        var categoryId = id;
        String baseUrl = Base.server;
        final url = '$baseUrl/productCategories/edit/productCategory/$categoryId/';

        print(url);

        Map data = {

          "BranchID":1,
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "CategoryName":nameController.text,
          "Notes":descriptionController.text,
          "CreatedUserID":371,


        };
        print(data);

        //encode Map to JSON
        var body = json.encode(data);
        var response = await http.post(Uri.parse(url),
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $accessToken',
            },
            body: body);
        print(response.body);
        Map n = json.decode(utf8.decode(response.bodyBytes));
        var status = n["StatusCode"];

        print(status);
        if (status == 6000) {

          getProductCategoryList();
        } else if (status == 6001) {
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg: msg);


          stop();
        } else {}
      } catch (e) {

          stop();
          msgBtmDialogueFunction(context: context, textMsg: e.toString());


      }
    }
  }

clear(){
    nameController.clear();
    descriptionController.clear();
}
}
List<ProductCategoryModel> productCategoryList = [];

class ProductCategoryModel {
  String uuid, categoryName, notes;

  ProductCategoryModel({
    required this.uuid,
    required this.notes,
    required this.categoryName,
  });

  factory ProductCategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductCategoryModel(
      uuid: json['id'],
      notes: json['Notes'],
      categoryName: json['ProductCategoryName'],
    );
  }
}
