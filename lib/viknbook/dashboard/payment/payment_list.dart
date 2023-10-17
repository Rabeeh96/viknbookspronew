import 'package:flutter/material.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom/global.dart';
import '../../custom/search_common_class.dart';
import 'new_payment.dart';

class PaymentList extends StatefulWidget {
  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  HomeController themeChangeController = Get.put(HomeController());
  TextEditingController searchController = TextEditingController();
  final List<String> texts = <String>["Pending", "Invoiced","Cancelled"];

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
          "Payments",
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
                MaterialPageRoute(builder: (context) => NewPayment()),
              );
            },
            icon:SvgPicture.asset("assets/svg/add.svg"),
          )
        ],
      ),
      body: Column(
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
          spaceWithHeight(6),
          Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15



                ),
                child: ListView.builder(
                    // the number of items in the list
                    itemCount: 6,
                    // display each item of the product list
                    itemBuilder: (context, index) {
                      return
                        Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 17,
                            child:

                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                                          text: 'Invoice No - ',
                                                                          style: customisedStyleBold(  context,    themeChangeController                                                        .isDarkMode.value
                                                                                  ? Colors.white
                                                                                  : Colors.black,
                                                                              FontWeight.w400,
                                                                              12.0)),
                                                                      TextSpan(
                                                                          text: 'South Indian bank',
                                                                          style: customisedStyleBold(
                                                                              context,
                                                                              const Color(0xff1662A9),
                                                                              FontWeight.w400,
                                                                              12.0)),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Ledger Name",
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
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              children: [
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
                                                                              Color(0xffe40f0f),
                                                                              FontWeight.w400,
                                                                              14.0)),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "DD/MM/YYYY",
                                                                  style: customisedStyleBold(
                                                                      context,
                                                                      const Color(0xff8F8F8F),
                                                                      FontWeight.w400,
                                                                      12.0),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )



                          ),
                          DividerStyle(),
                        ],
                      );
                    }),
              )),
        ],
      ),
    );
  }
}
