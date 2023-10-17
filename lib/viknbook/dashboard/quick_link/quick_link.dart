// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../app/modules/home/controllers/home_controller.dart';
// import '../../custom/global.dart';
// import 'add_link.dart';
// import 'model.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hive/hive.dart';
//
//
// class WishListScreen extends StatefulWidget {
//   // Ask Get to find our "controller"
//
//   WishListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }
//
// class _WishListScreenState extends State<WishListScreen> {
//   ///  final Products _p = Get.find<Products>();
//   HomeController themeChangeController = Get.put(HomeController());
//   final _favouriteBox = Hive.box('shopping_box');
//
//   List<Map<String, dynamic>> favItem = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final mHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//         appBar: AppBar(
//           titleSpacing: 0,
//           leading: IconButton(
//             onPressed: () {
//             Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back),
//             color: themeChangeController.isDarkMode.value
//                 ? Colors.white : Color(0xff000000),
//           ),
//           centerTitle: false,
//           title:  Text('Quick Link',style: customisedStyleBold(context,  themeChangeController.isDarkMode.value
//               ?Colors.white:Colors.black, FontWeight.w500, 16.0),),
//           actions: [
//             IconButton(  onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AddMenuPage())), icon: Icon(Icons.add,color: Colors.blue,))
//
//           ],
//         ),
//         body: ListView(
//           children: [
//             spaceWithHeight(8),
//
//             favItem.isEmpty
//                 ? Center(
//                 child:Text(
//                   'No Favorites yet',
//                   style: customisedStyleBold(
//                       context,
//                       themeChangeController.isDarkMode.value? Colors.white : Colors.black,
//                       FontWeight.w400,
//                       14.0),
//                 ))
//                 :
//             SingleChildScrollView(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: favItem.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     final currentItem = favItem[index];
//
//                     return SizedBox(
//                       height: MediaQuery.of(context).size.height/17,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10.0,right: 10),
//                         child: GestureDetector(
//                          /// onLongPress: () => _deleteItem(currentItem['key']),
//                           onTap: () async {
//                             try {
//                               var item = currentItem['name'] + "view";
//                               print(item);
//                               print(currentItem['name']);
//                               /// var perm = await checkingPerm(item);
//                               var perm = true;
//                               print(perm);
//                               if (perm) {
//                                 //   Navigator.pushNamed(context, '/payment_finance');
//                                 Navigator.pushNamed(
//                                     context, currentItem['action']);
//                               } else {
//                                 ///   dialogBoxNoPermission(context);
//                               }
//                             } catch (e) {
//                               print("---------------------------------");
//                               print(e.toString());
//                               print("---------------------------------");
//                             }
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: CircleAvatar(
//                                       backgroundColor: Colors.transparent,
//                                       child: SvgPicture.asset(
//                                         currentItem['icon'],
//                                         height: 23,
//                                         width: 22,
//                                       ),
//                                     ),
//                                   ),
//                                   spaceWithWidth(5),
//                                   Text(
//                                     currentItem['name'],
//                                     style: TextStyle(color: themeChangeController.isDarkMode.value?Colors.white:Colors.black),
//                                   ),
//                                 ],
//                               ),
//
//
//                               const Icon(
//                                 Icons.arrow_forward_ios,
//                                 // color: Get.isDarkMode ? Colors.black : Colors.white,
//                                 color:  Colors.grey,
//                                 size: 15,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             )
//           ],
//         )
//
//
//     );
//   }
// }