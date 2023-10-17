import 'package:flutter/material.dart';



import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../custom/global.dart';
import 'package:flutter_svg/svg.dart';

import 'create_sale.dart';
import 'detail/add_filter.dart';
import 'detail/detail_page.dart';

class SalesList extends StatefulWidget {
  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();

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
          "Sales Estimate",
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalesInvoice()),
              );
            },
            icon:SvgPicture.asset("assets/svg/add.svg"),
          )
        ],
      ),
      body: Column(
        children: [
          spaceWithHeight(8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaleFilter()),
              );
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
                      Text(
                        "Add Filters",
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            12.0),
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
                child: ListView.builder(
                    // the number of items in the list
                    itemCount: 6,

                    // display each item of the product list
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage()),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 17,
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
                                          RichText(
                                            text: TextSpan(
                                              //  style: TextStyle(color: Colors.black, fontSize: 36),

                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: '#',
                                                    style: customisedStyleBold(
                                                        context,
                                                        const Color(0xff7d7d7d),
                                                        FontWeight.w400,
                                                        12.0)),
                                                TextSpan(
                                                    text: 'Invoice No  ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        themeChangeController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.white
                                                            : Colors.black,
                                                        FontWeight.w400,
                                                        12.0)),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Customer Name",
                                            style: customisedStyleBold(
                                                context,
                                                themeChangeController
                                                        .isDarkMode.value
                                                    ? Color(0xffE8E8E8)
                                                    : Color(0xff1C3347),
                                                FontWeight.w400,
                                                14.0),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Pending",
                                            style: customisedStyleBold(
                                                context,
                                                const Color(0xffE81C1C),
                                                FontWeight.w400,
                                                12.0),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: themeChangeController
                                                          .isDarkMode.value
                                                      ? Colors.black
                                                      : Colors.white,
                                                  fontSize: 36),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'SAR ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        const Color(0xff8F8F8F),
                                                        FontWeight.w400,
                                                        14.0)),
                                                TextSpan(
                                                    text: '2,78,000.00 ',
                                                    style: customisedStyleBold(
                                                        context,
                                                        themeChangeController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors.white
                                                            : Colors.black,
                                                        FontWeight.w400,
                                                        14.0)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              DividerStyle(),
                            ],
                          ));
                    }),
              )),
        ],
      ),
    );
  }
}
