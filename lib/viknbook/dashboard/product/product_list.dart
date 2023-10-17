import 'package:flutter/material.dart';


import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/global.dart';
import '../../custom/search_common_class.dart';
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

import 'add_product.dart';
import 'detail/add_filter.dart';

class ProductLists extends StatefulWidget {
  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsLists.clear();
    getAllProducts();
  }
  void _navigateToNextScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddProduct(isEdit: isEdit),
      ),
    );
  }

  bool isEdit = false;

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
          "Products",
          style: customisedStyleBold(
              context,
              themeChangeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              FontWeight.w500,
              16.0),
        ),
        actions: [
          IconButton(
        //  onPressed: () =>_navigateToNextScreen(),
          onPressed: () {
            print("here");
        //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AddProduct(isEdit: isEdit)));
          },
      icon: SvgPicture.asset("assets/svg/add.svg"),
    )
        ],
      ),
      body: Column(
        children: [
          spaceWithHeight(8),
          GestureDetector(
            onTap: () {
              print("dfghj");

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddFilter()),
              );
              print("111111");
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 115, right: 115),
                child: Container(
                  height: MediaQuery.of(context).size.height / 25,
                  decoration: BoxDecoration(
                      color: themeChangeController.isDarkMode.value
                          ? Color(0xff1B2B30)
                          : Color(0xffEEF9FF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.filter_list,
                          color: Color(0xff0E74F4),
                          size: 18,
                        ),
                      ),
                      spaceWithWidth(7),
                      GestureDetector(
                        onTap: (){
                          Get.to( AddFilter());
                        },
                        child: Text(
                          "Add Filters",
                          style: customisedStyleBold(
                              context,
                              themeChangeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.black,
                              FontWeight.w400,
                              12.0),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          spaceWithHeight(8),
          Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: productsLists.isNotEmpty
                    ? ListView.builder(
                        // the number of items in the list
                        itemCount: productsLists.length,

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
                                    deleteItems(productsLists[index].uid);
                                  },
                                  secondBtnText: 'Delete');
                            },
                            key: Key('item ${[index]}'),
                            onDismissed: (direction) async {},
                            child: GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                17,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productsLists[index]
                                                      .productName,
                                                  style: customisedStyleBold(
                                                      context,
                                                      themeChangeController
                                                              .isDarkMode.value
                                                          ? Color(0xffE8E8E8)
                                                          : Color(0xff1C3347),
                                                      FontWeight.w400,
                                                      13.0),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Sales Price ',
                                                          style:
                                                              customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                      TextSpan(
                                                          text: 'SAR .',
                                                          style:
                                                              customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                      TextSpan(
                                                          text: productsLists[
                                                                  index]
                                                              .salesPrice,
                                                          style: customisedStyleBold(
                                                              context,
                                                              themeChangeController
                                                                      .isDarkMode
                                                                      .value
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              FontWeight.w400,
                                                              12.0)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(""),
                                                RichText(
                                                  text: TextSpan(
                                                    //  style: TextStyle(color: Colors.black, fontSize: 36),

                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Pur. Price ',
                                                          style:
                                                              customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff0A9EF3),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                      TextSpan(
                                                          text: 'SAR .',
                                                          style:
                                                              customisedStyleBold(
                                                                  context,
                                                                  const Color(
                                                                      0xff7d7d7d),
                                                                  FontWeight
                                                                      .w400,
                                                                  12.0)),
                                                      TextSpan(
                                                          text: productsLists[
                                                                  index]
                                                              .purchasePrice,
                                                          style: customisedStyleBold(
                                                              context,
                                                              themeChangeController
                                                                      .isDarkMode
                                                                      .value
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              FontWeight.w400,
                                                              12.0)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                    DividerStyle(),
                                  ],
                                )),
                          );
                        })
                    : Center(
                        child: Text(
                        "Something went wrong",
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Color(0xff000000),
                            FontWeight.w400,
                            15.0),
                      )),
              )),
        ],
      ),
    );
  }

  Future<Null> getAllProducts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      stop();
    } else {
      try {
        start(context);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var companyID = prefs.getString('companyID') ?? '';
        var userID = prefs.getInt('user_id') ?? 0;
        String baseUrl = Base.server;
        final String url = '$baseUrl/products/products-test/';
        var accessToken =
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";

        print(url);
        Map data = {
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
          "BranchID": 1,
          "CreatedUserID": 371,
          "PriceRounding": 2,
          "page_no": 1,
          "items_per_page": 30,
          "type": "Product"
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

        var status = n["StatusCode"];
        print(status);

        var responseJson = n["data"];
        print(responseJson);

        print(status);
        if (status == 6000) {
          setState(() {
            productsLists.clear();

            for (Map user in responseJson) {
              productsLists.add(ProductModel.fromJson(user));
            }
          });
        } else if (status == 6001) {
          msgBtmDialogueFunction(context: context, textMsg: "");
        }
        //DB Error
        else {}
      } catch (e) {
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
        var accessToken =
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU";
        var companyID = prefs.getString('companyID') ?? '';
        var userID = 371;
        var uID = id;
        print(uID);
        String baseUrl = Base.server;
        final String url = '$baseUrl/products/delete/product/$uID/';

        print(url);

        Map data = {
          "CreatedUserID": 371,
          "CompanyID": "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7",
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
            productsLists.clear();
            stop();
            getAllProducts();
          });
        } else if (status == 6001) {
          stop();
          var msg = n["message"];
          msgBtmDialogueFunction(context: context, textMsg: msg);
        } else {}
      } catch (e) {
        stop();
        msgBtmDialogueFunction(context: context, textMsg: e.toString());
      }
    }
  }
}

List<ProductModel> productsLists = [];

class ProductModel {
  String uid, productName, description, purchasePrice, salesPrice;
  int productID;

  //double salesPrice;
  // purchasePrice,salesPrice;

  ProductModel(
      {required this.uid,
      required this.productName,
      required this.productID,
      required this.description,
      required this.salesPrice,
      required this.purchasePrice});

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductModel(
      uid: json['id'],
      productName: json['ProductName'],
      productID: json['ProductID'],
      description: json['Description'],
      purchasePrice: json['DefaultPurchasePrice'].toString(),
      salesPrice: json['DefaultSalesPrice'].toString(),
    );
  }
}
