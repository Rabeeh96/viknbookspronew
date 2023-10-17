import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/modules/home/controllers/home_controller.dart';
import '../../custom/global.dart';
import 'package:get/get.dart';
import '../../custom/global.dart';
import '../settings/settings_page.dart';
///raz

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var items = [
    'customer',
    'supplier'];

  String dropdownvalue = 'customer';
  HomeController themeChangeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    double mqh = MediaQuery.of(context).size.height;
    double mqw = MediaQuery.of(context).size.width;

    return Scaffold(

        body: Container(
            margin: EdgeInsets.all(20),
            height: mHeight,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(

                children: [
                  SizedBox(height: mHeight*.04,),
                  ///re wrk
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height:mqh*.30 ,
                          width:mqw*.92,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFF9BE33).withOpacity(.065),
                                  // Colors.white.withOpacity(.01),
                                  Colors.lightBlueAccent.withOpacity(.08)
                                ],
                                stops: const [0.3, 1],
                                begin:  Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: Colors.grey.withOpacity(.2))
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0,left: 6,right: 6),
                                child: Container(
                                  height: mqh*.100,
                                  width:mqw*.845,
                                  decoration: const BoxDecoration(
                                    // border: Border.all(color: Colors.black,width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: mqh*.088,
                                          width: mqw*.185,
                                          decoration:BoxDecoration(
                                              color: Colors.white38,
                                              borderRadius: BorderRadius.circular(10)
                                          ) ,
                                          child: Image.network('https://picsum.photos/250?image=9'),
                                        ),

                                         Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 21,),
                                            Text(
                                              "Savad farooque",
                                              style: customisedStyleBold(
                                                  context,
                                                  themeChangeController.isDarkMode.value
                                                      ? Colors.white
                                                      : Colors.black,
                                                  FontWeight.w500,
                                                  16.0),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "savadfarooque@gmail.com",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff7d7d7d),
                                                height: 20/13,
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),

                                        IconButton(
                                            onPressed: (){},
                                            icon: SvgPicture.asset('assets/edit.svg',width: 20,height:20 ,))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 11.0),
                                child: Container(
                                  height: mqh*.090,
                                  width:mqw*.845,
                                  decoration: BoxDecoration(
                                      color: Colors.white30,
                                      border: Border.all(color: Colors.grey.withOpacity(.05)),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Text(
                                              "Organization",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff7d7d7d),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "Fossa Solutions PVT LTD",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff000000),
                                                height: 24/16,
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(height: 28,),
                                          Container(
                                            height: mqh*.05,
                                            width: mqw*.2,
                                            decoration: const BoxDecoration(
                                                color:Colors.transparent),
                                            child:
                                            TextButton(
                                              onPressed: (){},
                                              child: const Text(
                                                "Change",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff0a9ef3),
                                                  height: 21/14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 11.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                      },
                                      child: Container(
                                        height: mqh*.045,
                                        width: mqw*.40,
                                        decoration: BoxDecoration(
                                          color:Colors.grey.withOpacity(.2),
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset('assets/svg/delete.svg',width: 19,height: 19,),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 3,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 3.5,),
                                                Text(
                                                  "Delete Account",
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffc80000),
                                                    // height: 23/15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20,),

                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: mqh*.045,
                                        width: mqw*.30,
                                        decoration: BoxDecoration(
                                          color:const Color(0xFFFFCFCF),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset('assets/svg/logout.svg',width: 22,height: 22,),
                                              ],
                                            ),
                                            const SizedBox(width: 3,),
                                            const Text(
                                              "Logout",
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xffea6262),
                                                height: 23/15,
                                              ),
                                              textAlign: TextAlign.left,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
//                   Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft, end: Alignment.bottomRight,
//                           colors:themeChangeController.isDarkMode.value?
//                       ///    #FFF9BE, #FFFFFF00
//
//                           [Color(0xff08131E), Color(0xff08131E)]:
//                           [Color(0xffE6E6E6), Color(0xffFFFFFF)],
//                          // [Color(0xfffff8be), Color(0x00ffffff)],
//                         ),
//
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color:themeChangeController.isDarkMode.value?
//
//                       Color(0xff08131e):
//                         Color(0xffE6E6E6))
//                     ),
//                     height: mHeight*.26,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: mHeight*.10,
//                           // color: Colors.white,
//                           child: ListTile(
//                             leading: ClipRRect(
//                               borderRadius: BorderRadius.circular(18.0),//or 15.0
//                               child: Container(
//                                 height: 60.0,
//                                 width: 55.0,
//                                 color: Colors.grey,
//                                child:SvgPicture.asset("assets/svg/Person.svg") ,
//                               ),
//                             ),
//                             title: Text("Savad farooque",style:  customisedStyleBold(
//                                 context,
//                                 themeChangeController.isDarkMode.value? Colors.white : Colors.black,
//                                 FontWeight.w400,
//                                 16.0),),
//                             subtitle:  Text("Savad@gmail.com",style:  customisedStyleBold(
//                                 context,
//                                 Color(0xffB5CDFE),
//                                 FontWeight.w400,
//                                 13.0),),
//                             trailing: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/svg/edits.svg")),
//
//                           ),
//                         ),
//                         Container(
//                           //alignment: Alignment.center,
//                           margin: EdgeInsets.only(left: mWidth*.02,right: mWidth*.02),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(11),
//
//                           ),
//                           height: mHeight*.08,
//                           // color: Colors.white,
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(11)
//                             ),
//                             color: themeChangeController.isDarkMode.value? Color(0xff0E1A27) : Color(0xffF2F2F2),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 8.0,right: 8),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
// mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                               Text("Organisation",style: customisedStyle(context, Color(0xff7D7D7D), FontWeight.w400, 14.0),),
//                                         Text("Fossa Solutions PVT LTD",style:  customisedStyleBold(
//                                             context,
//                                             themeChangeController.isDarkMode.value? Colors.white : Colors.black,
//                                             FontWeight.w400,
//                                             16.0),),
//
//                                 ]
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text("",style: customisedStyle(context, Color(0xff0A9EF3), FontWeight.w400, 14.0),),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 8.0),
//                                         child: Text("Change",style: customisedStyle(context, Color(0xff0A9EF3), FontWeight.w400, 14.0),),
//                                       ),
//
//                                     ],
//                                   )
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                        spaceWithHeight(4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               width: mWidth*.43,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(17)
//                               ),
//                               child: ElevatedButton(
//
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     SvgPicture.asset("assets/svg/delete.svg",color: Color(0xffC80000),),
//                                     Text('Delete Account',style: customisedStyle(context, Color(0xffC80000), FontWeight.w400, 12.0),),
//                                   ],
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(17),
//                                   ),
//                                   primary:themeChangeController.isDarkMode.value?
//                                   Color(0xff090E14):Color(0xffF2F2F2),
//                                   textStyle: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10,
//                                       fontStyle: FontStyle.normal),
//                                 ),
//                                 onPressed: () {},
//                               ),
//                             ),
//
//                             Container(
//                               width: mWidth*.34,
//                               child: ElevatedButton(
//                                 child: Row(
//
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     SvgPicture.asset("assets/svg/logout.svg"),
//                                     Text('Logout',style: customisedStyle(context, Color(0xffEA6262), FontWeight.w400, 12.0),),
//                                   ],
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(17),
//                                   ),
//                                   primary: themeChangeController.isDarkMode.value?
//                                   Color(0xff040404): Color(0xffFFCFCF),
//                                   textStyle: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 10,
//                                       fontStyle: FontStyle.normal),
//                                 ),
//                                 onPressed: () {},
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//
//                   ),

                  SizedBox(height: mHeight*.01,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Card(

                      color:themeChangeController.isDarkMode.value
                          ?  Color(0xff000000):Color(0xffffffff),
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/svg/settings-2.svg"),
                                spaceWithWidth(8),

                                Text("Settings",style:  customisedStyleBold(
                                    context,
                                    themeChangeController.isDarkMode.value? Colors.white : Colors.black,
                                    FontWeight.w400,
                                    16.0),)
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,size: 18,)
                          ],
                        ),
                      ),
                    ),
                  ),

                  DividerStyle(),
                  Card(
                    color:themeChangeController.isDarkMode.value
                        ?  Color(0xff000000):Color(0xffffffff),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                      SvgPicture.asset("assets/svg/printer.svg",color: Color(0xff0A9EF3) ,),
                              spaceWithWidth(8),

                              Text("Print Settings",style:  customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value? Colors.white : Colors.black,
                                  FontWeight.w400,
                                  16.0),)
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,)
                        ],
                      ),
                    ),
                  ),

                  DividerStyle(),
                  Card(
                    color:themeChangeController.isDarkMode.value
                        ?  Color(0xff000000):Color(0xffffffff),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/contacts.svg",color: Color(0xff0A9EF3)),
                              spaceWithWidth(8),

                              Text("Contact us",style:  customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value? Colors.white : Colors.black,
                                  FontWeight.w400,
                                  16.0),),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,)
                        ],
                      ),
                    ),
                  ),

                  DividerStyle(),
                  Card(
                    color:themeChangeController.isDarkMode.value
                        ?  Color(0xff000000):Color(0xffffffff),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/information.svg",color: Color(0xff0A9EF3)),
                              spaceWithWidth(8),

                              Text("About us",style:  customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value? Colors.white : Colors.black,
                                  FontWeight.w400,
                                  16.0),),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,size: 18,)
                        ],
                      ),
                    ),
                  ),

                  DividerStyle(),
                  Card(
                    elevation: 0,
                    color:themeChangeController.isDarkMode.value
                        ?  Color(0xff000000):Color(0xffffffff),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/svg/language-hiragana(1).svg",color: Color(0xff0A9EF3)),
                              spaceWithWidth(8),

                              Text("Language",style:  customisedStyleBold(
                                  context,
                                  themeChangeController.isDarkMode.value? Colors.white : Colors.black,
                                  FontWeight.w400,
                                  16.0),),
                            ],
                          ),
                          Text("English",style: customisedStyleBold(context, Color(0xffB5CDFE),  FontWeight.w400, 12.0),)
                        ],
                      ),
                    ),
                  ),






                ],
              ),

            ))


    );
  }
}


