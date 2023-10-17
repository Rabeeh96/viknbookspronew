import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/modules/home/controllers/home_controller.dart';
import '../../custom/global.dart';
import '../../custom/search_common_class.dart';
import 'package:hive/hive.dart';

class AddMenuPage extends StatefulWidget {
  // Instantiate our Products class using Get.put()

  AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  @override
  void initState() {
    // TODO: implement initState
    getMenu();
    super.initState();
  }
var favItemList = [];

  TextEditingController textController = TextEditingController();
  bool isFav = false;

  void filterSearchResults(String query) {
    List<MenuModel> demoList = [];
    demoList.addAll(menuList);
    if (query.isNotEmpty) {
      List<MenuModel> dummyListData = [];
      demoList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        searchList.clear();
        searchList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchList.clear();
        searchList.addAll(menuList);
      });
    }
  }

  void wishListView(bool query) {
    List<MenuModel> demoList = [];
    demoList.addAll(menuList);
    if (query == true) {
      List<MenuModel> dummyListData = [];
      for (var item in demoList) {
        dummyListData.add(item);
      }
      setState(() {
        favItemList.clear();
        favItemList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        favItemList.clear();
        favItemList.addAll(menuList);
      });
    }
  }

  HomeController themeChangeController = Get.put(HomeController());

  TextEditingController searchController = TextEditingController();
  bool isView = false;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: isView == true
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    isView=false;
                  });
                },
                icon: Icon(Icons.arrow_back),
                color: themeChangeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xff000000),
              ),
              elevation: 0,
              titleSpacing: 0,
              centerTitle: false,
              title: Text(
                "Add a link ",
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                    FontWeight.w500,
                    16.0),
              ),
            )
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
                color: themeChangeController.isDarkMode.value
                    ? Colors.white
                    : Color(0xff000000),
              ),
              elevation: 0,
              titleSpacing: 0,
              centerTitle: false,
              title: Text(
                "Quick link ",
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
                      setState(() {
                        isView = true;
                      });
                    },
                    icon:SvgPicture.asset("assets/svg/add.svg"))
              ],
            ),
      body: isView == true
          ? Column(
              children: [
                spaceWithHeight(8),
                SearchFieldWidget(
                  autoFocus: false,
                  mHeight: mHeight,
                  hintText: 'Search',
                  controller: searchController,
                  onChanged: (quary) async {
                    filterSearchResults(searchController.text);
                  },
                ),
                spaceWithHeight(6),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListView.builder(
                      itemCount: searchList.length,
                      // List item widget
                      itemBuilder: (context, index) {
                        final product = searchList[index];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                wishListView(false);

                                setState(() {
                                  isView = false;
                                });
                              },
                              child: SizedBox(
                                height: mHeight * .05,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            product.value,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                35,
                                          ),
                                          spaceWithWidth(8),
                                          Text(
                                            product.name,
                                            style: customisedStyleBold(
                                                context,
                                                themeChangeController
                                                        .isDarkMode.value
                                                    ? Colors.white
                                                    : Colors.black,
                                                FontWeight.w400,
                                                14.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            DividerStyle(),
                          ],
                        );
                      }),
                ))
              ],
            )
          : ListView(
              children: [
                spaceWithHeight(8),
                favItemList.isEmpty
                    ? Center(
                        child: Text(
                        'No Favorites yet',
                        style: customisedStyleBold(
                            context,
                            themeChangeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w400,
                            14.0),
                      ))
                    : SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: favItemList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height / 17,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: SvgPicture.asset(
                                                  favItemList[index].value,
                                                  height: 23,
                                                  width: 22,
                                                ),
                                              ),
                                            ),
                                            spaceWithWidth(5),
                                            Text(
                                              favItemList[index].name,
                                              style: TextStyle(
                                                  color: themeChangeController
                                                          .isDarkMode.value
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          // color: Get.isDarkMode ? Colors.black : Colors.white,
                                          color: Colors.grey,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            ),
    );
  }

  Future getMenu() async {
    var responseJson = [
      {
        "value": "assets/svg/customer.svg",
        "name": "Add Customer",
        "icon": "assets/svg/customer.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
      {
        "value": "assets/svg/sale.svg",
        "name": "Create Sales Invoice",
        "icon": "assets/svg/sale.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
      {
        "value": "assets/svg/purchase.svg",
        "name": "Create Purchase Invoice",
        "icon": "assets/svg/purchase.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
      {
        "value": "assets/svg/product.svg",
        "name": "Add products",
        "icon": "assets/svg/product.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
      {
        "value": "assets/svg/expense.svg",
        "name": "Add expense",
        "icon": "assets/svg/expense.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
      {
        "value": "assets/svg/sale_report.svg",
        "name": "Sales Report",
        "icon": "assets/svg/sale_report.svg",
        "navigation": "nav",
        "inWishList": false,
        "id": 0
      },
    ];
    for (Map user in responseJson) {
      menuList.add(MenuModel.fromJson(user));
    }
    searchList.addAll(menuList);
  }
}

List<MenuModel> menuList = [];
List<MenuModel> searchList = [];
///List<MenuModel> favItemList = [];

class MenuModel {
  int id;
  final String value, name, navigation;
  bool inWishList;

  MenuModel(
      {required this.value,
      required this.name,
      required this.navigation,
      required this.id,
      required this.inWishList});

  factory MenuModel.fromJson(Map<dynamic, dynamic> json) {
    return MenuModel(
      value: json['value'],
      name: json['name'],
      navigation: json['navigation'],
      id: json['id'],
      inWishList: json['inWishList'],
    );
  }
}

///
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../app/modules/home/controllers/home_controller.dart';
// import '../../custom/global.dart';
// import '../../custom/search_common_class.dart';
//
// class AddMenuPage extends StatefulWidget {
//   // Instantiate our Products class using Get.put()
//
//   AddMenuPage({Key? key}) : super(key: key);
//
//   @override
//   State<AddMenuPage> createState() => _AddMenuPageState();
// }
//
// class _AddMenuPageState extends State<AddMenuPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     getMenu();
//     super.initState();
//   }
//
//   TextEditingController textController = TextEditingController();
//
//   void filterSearchResults(String query) {
//     List<MenuModel> demoList = [];
//     demoList.addAll(menuList);
//
//     if (query.isNotEmpty) {
//       List<MenuModel> dummyListData = [];
//       demoList.forEach((item) {
//         if (item.name.toLowerCase().contains(query.toLowerCase())) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         searchList.clear();
//         searchList.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         searchList.clear();
//         searchList.addAll(menuList);
//       });
//     }
//   }
//
//   HomeController themeChangeController = Get.put(HomeController());
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final mHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar:  AppBar(
//           leading: IconButton(
//             onPressed: () {
//
//               //   Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back),
//             color: themeChangeController.isDarkMode.value
//                 ? Colors.white : Color(0xff000000),
//           ),
//
//
//           elevation: 0,
//           titleSpacing: 0,
//           centerTitle: false,
//           title: Text(
//             "Add a link ",
//             style:  customisedStyleBold(context,  themeChangeController.isDarkMode.value
//                 ?Colors.white:Colors.black, FontWeight.w500, 16.0),
//           ),
//         ),
//       body: Column(
//         children: [
//           spaceWithHeight(8),
//           SearchFieldWidget(
//             autoFocus: false,
//             mHeight: mHeight,
//             hintText: 'Search',
//             controller: searchController,
//             onChanged: (quary) async {
//               filterSearchResults(searchController.text);
//             },
//           ),
//           spaceWithHeight(6),
//           Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//                 child: ListView.builder(
//                     itemCount: searchList.length,
//                     // List item widget
//                     itemBuilder: (context, index) {
//                       final product = searchList[index];
//                       return Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//
//                             Navigator.pop(context);
//                             },
//                             child: SizedBox(
//                               height: mHeight * .05,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           product.value,
//                                           width:
//                                               MediaQuery.of(context).size.width / 20,
//                                           height:
//                                               MediaQuery.of(context).size.height / 35,
//                                         ),
//                                         spaceWithWidth(8),
//                                         Text(
//                                           product.name,
//                                           style: customisedStyleBold(
//                                               context,
//                                               themeChangeController.isDarkMode.value
//                                                   ? Colors.white
//                                                   : Colors.black,
//                                               FontWeight.w400,
//                                               14.0),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           divider(0.1,themeChangeController.isDarkMode.value?Color(0xffE8E8E8):Color(0xff1C3347)),
//
//                         ],
//                       );
//                     }),
//               ))
//         ],
//       ),
//     );
//   }
//
//   Future getMenu() async {
//     var responseJson = [
//       {
//         "value": "assets/svg/customer.svg",
//         "name": "Add Customer",
//         "icon": "assets/svg/customer.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//       {
//         "value": "assets/svg/sale.svg",
//         "name": "Create Sales Invoice",
//         "icon": "assets/svg/sale.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//       {
//         "value": "assets/svg/purchase.svg",
//         "name": "Create Purchase Invoice",
//         "icon": "assets/svg/purchase.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//       {
//         "value": "assets/svg/product.svg",
//         "name": "Add products",
//         "icon": "assets/svg/product.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//       {
//         "value": "assets/svg/expense.svg",
//         "name": "Add expense",
//         "icon": "assets/svg/expense.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//       {
//         "value": "assets/svg/sale_report.svg",
//         "name": "Sales Report",
//         "icon": "assets/svg/sale_report.svg",
//         "navigation": "nav",
//         "inWishList": false,
//         "id": 0
//       },
//     ];
//     for (Map user in responseJson) {
//       menuList.add(MenuModel.fromJson(user));
//     }
//     searchList.addAll(menuList);
//   }
//
//   void addItem(int id) {
//     final int index = menuList.indexWhere((item) => item.id == id);
//     menuList[index].inWishList = true;
//   }
//
//   void removeItem(int id) {
//     // final int index = _items.indexWhere((item) => item.id == id);
//     // _items[index].inWishList.value = false;
//   }
// }
//
// List<MenuModel> menuList = [];
// List<MenuModel> searchList = [];
// List<MenuModel> itemsList = [];
//
// class MenuModel {
//   int id;
//   final String value, name, navigation;
//   bool inWishList;
//
//   MenuModel(
//       {required this.value,
//       required this.name,
//       required this.navigation,
//       required this.id,
//       required this.inWishList});
//
//   factory MenuModel.fromJson(Map<dynamic, dynamic> json) {
//     return MenuModel(
//       value: json['value'],
//       name: json['name'],
//       navigation: json['navigation'],
//       id: json['id'],
//       inWishList: json['inWishList'],
//     );
//   }
// }
