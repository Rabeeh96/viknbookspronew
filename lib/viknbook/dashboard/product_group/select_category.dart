import 'package:flutter/material.dart';
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
class SelectCategory extends StatefulWidget{
  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

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
          "Select Category",
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
            SearchFieldWidget(
              autoFocus: false,
              mHeight: mHeight,
              hintText: 'Search',
              controller: searchController,
              onChanged: (quary) async {
                ///  filterSearchResults(searchController.text);
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
                        return  GestureDetector(
                          onTap: (){

                           Navigator.pop(context,[productCategoryList[index].productCategoryID,productCategoryList[index].categoryName] );
                       //  Navigator.pop(context,productCategoryList[index].categoryName );
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


  Future<Null> getCategoryList() async {
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
          msgBtmDialogueFunction(context: context, textMsg:msg);

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

}
List<ProductCategoryModel> productCategoryList = [];
List<ProductCategoryModel> searchList = [];

class ProductCategoryModel {
  int productCategoryID;
  String uuid, categoryName, notes;

  ProductCategoryModel({
    required this.uuid,
    required this.notes,
    required this.categoryName,
    required this.productCategoryID,
  });

  factory ProductCategoryModel.fromJson(Map<dynamic, dynamic> json) {
    return ProductCategoryModel(
      uuid: json['id'],
      notes: json['Notes'],
      categoryName: json['ProductCategoryName'],
      productCategoryID: json['ProductCategoryID'],
    );
  }
}