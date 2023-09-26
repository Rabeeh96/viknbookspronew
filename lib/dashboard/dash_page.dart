import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import '../custom/global.dart';
class DashboardPage extends StatefulWidget{
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController controller =
  PageController(initialPage: 0, viewportFraction: 1.1);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      SlideCard(
          cardDetail: Card(
            color: Color(0xffD9D9D9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xffEEEBD8),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Call Suhail for discussing Step \ncounting app.",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w500, 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xffE8E8E8),
                    thickness: .5,
                  ),

                  Text(
                      "Call Suhail for discussing Step counting app. Call Suhail Call Suhail for discussing Step counting app. Call Suhail...",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12/09/2023",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 26,
                        decoration: BoxDecoration(
                            color: Color(0xffE84444),
                            borderRadius: BorderRadius.circular(28)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("High",
                              style: customisedStyleBold(
                                  context, Color(0xffffffff), FontWeight.w400, 11.0)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12.00",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Savad",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w400, 14.0),
                          ),
                          Icon(Icons.person),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
      SlideCard(
          cardDetail: Card(
            color: Color(0xffD9D9D9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xffEEEBD8),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Call Suhail for discussing Step \ncounting app.",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w500, 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xffE8E8E8),
                    thickness: .5,
                  ),

                  Text(
                      "Call Suhail for discussing Step counting app. Call Suhail Call Suhail for discussing Step counting app. Call Suhail...",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12/09/2023",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 26,
                        decoration: BoxDecoration(
                            color: Color(0xffE84444),
                            borderRadius: BorderRadius.circular(28)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("High",
                              style: customisedStyleBold(
                                  context, Color(0xffffffff), FontWeight.w400, 11.0)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12.00",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Savad",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w400, 14.0),
                          ),
                          Icon(Icons.person),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
      SlideCard(
          cardDetail: Card(
            color: Color(0xffD9D9D9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xffEEEBD8),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Call Suhail for discussing Step \ncounting app.",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w500, 14.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xffE8E8E8),
                    thickness: .5,
                  ),

                  Text(
                      "Call Suhail for discussing Step counting app. Call Suhail Call Suhail for discussing Step counting app. Call Suhail...",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12/09/2023",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 26,
                        decoration: BoxDecoration(
                            color: Color(0xffE84444),
                            borderRadius: BorderRadius.circular(28)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("High",
                              style: customisedStyleBold(
                                  context, Color(0xffffffff), FontWeight.w400, 11.0)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            color: Color(0xff0E75F4),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("12.00",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Savad",
                            style: customisedStyleBold(
                                context, Colors.black, FontWeight.w400, 14.0),
                          ),
                          Icon(Icons.person),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    ];
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
   return  ListView(
     children: [
       Divider(
         color: Color(0xffE8E8E8),
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Icon(
             Icons.circle,
             color: Color(0xffF4F4F4),
             weight: 30,
           ),
           Padding(
             padding:
             const EdgeInsets.only(left: 5.0, bottom: 6),
             child: Text(
               "Organization",
               style: customisedStyleBold(
                   context, Colors.black, FontWeight.w400, 16.0),
             ),
           ),
         ],
       ),
       Divider(
         color: Color(0xffE8E8E8),
         endIndent: 60,
         indent: 60,
       ),
       Padding(
         padding: const EdgeInsets.all(5.0),
         child: Center(
           child: Text(
             "Upcoming Activities",
             style: customisedStyleBold(
                 context, Colors.black, FontWeight.w400, 16.0),
           ),
         ),
       ),

       Container(
         height: MediaQuery.of(context).size.height/3.5,
         child: Column(
           children: [
             Container(
               height: MediaQuery.of(context).size.height/4.3,
               child: PageView.builder(
                 itemCount: items.length,
                 controller: controller,
                 onPageChanged: (value) {
                   setState(() {
                     currentIndex = value;
                   });
                 },
                 physics: const BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.only(left: 12.0,right: 12),
                     child: items[index],
                   );
                 },
               ),
             ),

             const SizedBox(
               height: 16,
             ),
             IndicatorWidget(
               currentIndex: currentIndex,
               length: items.length - 1,
             ),

           ],
         ),
       ),
       Center(
         child: Text("view all actvities",
             style: customisedStyleBold(context,
                 Color(0xff379FFF), FontWeight.w400, 14.0)),
       ),
       SizedBox(height: 12,),
       Divider(
         color: Color(0xffE8E8E8),
       ),
       SizedBox(height: 6,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(
           child: Text("Overview",
               style: customisedStyleBold(
                   context, Colors.black, FontWeight.w400, 16.0)),
         ),
       ),
       SizedBox(
         height: 10,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0, right: 12),
         child: Container(
           height: MediaQuery.of(context).size.height / 15,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: LinearGradient(colors: [
                 Color(0xffF0F9FC),
                 Color(0xffF8F8F8),
               ])),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Container(
                       width: MediaQuery.of(context).size.width /
                           12,
                       height:
                       MediaQuery.of(context).size.height /
                           20,
                       decoration: BoxDecoration(
                         color: Color(0xffD9F6FF),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: SvgPicture.asset(
                         "assets/svg/moneybag.svg",
                         width: 16,
                         height: 18,
                         color: Color(0xff065B76),
                       ),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment:
                     CrossAxisAlignment.start,
                     children: [
                       Text(" Revenue",
                           style: customisedStyleBold(
                               context,
                               Colors.black,
                               FontWeight.w400,
                               16.0)),
                       RichText(
                         text: TextSpan(
                           //  style: TextStyle(color: Colors.black, fontSize: 36),

                           children: <TextSpan>[
                             TextSpan(
                                 text: '+21%  ',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff199E56),
                                     FontWeight.w400,
                                     14.0)),
                             TextSpan(
                                 text: 'than last month.',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff8F8F8F),
                                     FontWeight.w400,
                                     14.0)),
                           ],
                         ),
                       )
                     ],
                   ),
                 ],
               ),
               RichText(
                 text: TextSpan(
                   //  style: TextStyle(color: Colors.black, fontSize: 36),

                   children: <TextSpan>[
                     TextSpan(
                         text: 'SAR ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff8F8F8F),
                             FontWeight.w400,
                             14.0)),
                     TextSpan(
                         text: '2,78,000.00 ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff000000),
                             FontWeight.w400,
                             14.0)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       SizedBox(
         height: 8,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0, right: 12),
         child: Container(
           height: MediaQuery.of(context).size.height / 15,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: LinearGradient(colors: [
                 Color(0xffFFF5F5),
                 Color(0xffF8F8F8),
               ])),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Container(
                       width: MediaQuery.of(context).size.width /
                           12,
                       height:
                       MediaQuery.of(context).size.height /
                           20,
                       decoration: BoxDecoration(
                         color: Color(0xffFFE1E1),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: SvgPicture.asset(
                         "assets/svg/moneybag.svg",
                         width: 16,
                         height: 18,
                         color: Color(0xff9B0404),
                       ),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment:
                     CrossAxisAlignment.start,
                     children: [
                       Text(" Revenue",
                           style: customisedStyleBold(
                               context,
                               Colors.black,
                               FontWeight.w400,
                               16.0)),
                       RichText(
                         text: TextSpan(
                           //  style: TextStyle(color: Colors.black, fontSize: 36),

                           children: <TextSpan>[
                             TextSpan(
                                 text: '+21%  ',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff9B0404),
                                     FontWeight.w400,
                                     14.0)),
                             TextSpan(
                                 text: 'than last month.',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff8F8F8F),
                                     FontWeight.w400,
                                     14.0)),
                           ],
                         ),
                       )
                     ],
                   ),
                 ],
               ),
               RichText(
                 text: TextSpan(
                   //  style: TextStyle(color: Colors.black, fontSize: 36),

                   children: <TextSpan>[
                     TextSpan(
                         text: 'SAR ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff8F8F8F),
                             FontWeight.w400,
                             14.0)),
                     TextSpan(
                         text: '2,78,000.00 ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff000000),
                             FontWeight.w400,
                             14.0)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       SizedBox(
         height: 8,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0, right: 12),
         child: Container(
           height: MediaQuery.of(context).size.height / 15,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: LinearGradient(colors: [
                 Color(0xffF1FCF0),
                 Color(0xffF8F8F8),
               ])),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Container(
                       width: MediaQuery.of(context).size.width /
                           12,
                       height:
                       MediaQuery.of(context).size.height /
                           20,
                       decoration: BoxDecoration(
                         color: Color(0xffE0F5E2),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: SvgPicture.asset(
                         "assets/svg/moneybag.svg",
                         width: 16,
                         height: 18,
                         color: Color(0xff046C0D),
                       ),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment:
                     CrossAxisAlignment.start,
                     children: [
                       Text(" Revenue",
                           style: customisedStyleBold(
                               context,
                               Colors.black,
                               FontWeight.w400,
                               16.0)),
                       RichText(
                         text: TextSpan(
                           //  style: TextStyle(color: Colors.black, fontSize: 36),

                           children: <TextSpan>[
                             TextSpan(
                                 text: '+21%  ',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff9B0404),
                                     FontWeight.w400,
                                     14.0)),
                             TextSpan(
                                 text: 'than last month.',
                                 style: customisedStyleBold(
                                     context,
                                     Color(0xff8F8F8F),
                                     FontWeight.w400,
                                     14.0)),
                           ],
                         ),
                       )
                     ],
                   ),
                 ],
               ),
               RichText(
                 text: TextSpan(
                   //  style: TextStyle(color: Colors.black, fontSize: 36),

                   children: <TextSpan>[
                     TextSpan(
                         text: 'SAR ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff8F8F8F),
                             FontWeight.w400,
                             14.0)),
                     TextSpan(
                         text: '2,78,000.00 ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff000000),
                             FontWeight.w400,
                             14.0)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       SizedBox(
         height: 8,
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Padding(
             padding:
             const EdgeInsets.only(left: 12.0,),
             child: Container(
               width: MediaQuery.of(context).size.width / 2.3,
               height: MediaQuery.of(context).size.height / 10,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   gradient: LinearGradient(colors: [
                     Color(0xffF1FCF0),
                     Color(0xffF8F8F8),
                   ])),
               child: Column(
                 mainAxisAlignment:
                 MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: Container(
                           width: MediaQuery.of(context)
                               .size
                               .width /
                               12,
                           height: MediaQuery.of(context)
                               .size
                               .height /
                               20,
                           decoration: BoxDecoration(
                             color: Color(0xffE0F5E2),
                             borderRadius:
                             BorderRadius.circular(10),
                           ),
                           child: SvgPicture.asset(
                             "assets/svg/moneybag.svg",
                             width: 16,
                             height: 18,
                             color: Colors.blue.shade900,
                           ),
                         ),
                       ),
                       Text(" Bank",
                           style: customisedStyleBold(
                               context,
                               Colors.black,
                               FontWeight.w400,
                               16.0)),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10.0),
                     child: RichText(
                       text: TextSpan(
                         //  style: TextStyle(color: Colors.black, fontSize: 36),

                         children: <TextSpan>[
                           TextSpan(
                               text: 'SAR ',
                               style: customisedStyleBold(
                                   context,
                                   Color(0xff8F8F8F),
                                   FontWeight.w400,
                                   14.0)),
                           TextSpan(
                               text: '2,78,000.00 ',
                               style: customisedStyleBold(
                                   context,
                                   Color(0xff000000),
                                   FontWeight.w400,
                                   14.0)),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
           Padding(
             padding:
             const EdgeInsets.only( right: 12),
             child: Container(
               width: MediaQuery.of(context).size.width / 2.3,
               height: MediaQuery.of(context).size.height / 10,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   gradient: LinearGradient(colors: [
                     Color(0xffF1FCF0),
                     Color(0xffF8F8F8),
                   ])),
               child: Column(
                 mainAxisAlignment:
                 MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: Container(
                           width: MediaQuery.of(context)
                               .size
                               .width /
                               12,
                           height: MediaQuery.of(context)
                               .size
                               .height /
                               20,
                           decoration: BoxDecoration(
                             color: Color(0xffE0F5E2),
                             borderRadius:
                             BorderRadius.circular(10),
                           ),
                           child: SvgPicture.asset(
                             "assets/svg/moneybag.svg",
                             width: 16,
                             height: 18,
                             color: Color(0xff046C0D),
                           ),
                         ),
                       ),
                       Text(" Revenue",
                           style: customisedStyleBold(
                               context,
                               Colors.black,
                               FontWeight.w400,
                               16.0)),
                     ],
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 8.0),
                     child: RichText(
                       text: TextSpan(
                         //  style: TextStyle(color: Colors.black, fontSize: 36),

                         children: <TextSpan>[
                           TextSpan(
                               text: 'SAR ',
                               style: customisedStyleBold(
                                   context,
                                   Color(0xff8F8F8F),
                                   FontWeight.w400,
                                   13.0)),
                           TextSpan(
                               text: '2,78,000. ',
                               style: customisedStyleBold(
                                   context,
                                   Color(0xff000000),
                                   FontWeight.w400,
                                   13.0)),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
         ],
       ),
       SizedBox(
         height: 8,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0, right: 12),
         child: Container(
           height: MediaQuery.of(context).size.height / 15,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: LinearGradient(colors: [
                 Color(0xffF0F9FC),
                 Color(0xffF8F8F8),
               ])),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Container(
                       width: MediaQuery.of(context).size.width /
                           12,
                       height:
                       MediaQuery.of(context).size.height /
                           20,
                       decoration: BoxDecoration(
                         color: Color(0xffD9F6FF),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: SvgPicture.asset(
                         "assets/svg/moneybag.svg",
                         width: 16,
                         height: 18,
                         color: Color(0xff065B76),
                       ),
                     ),
                   ),
                   Text(" Credit",
                       style: customisedStyleBold(context,
                           Colors.black, FontWeight.w400, 16.0)),
                 ],
               ),
               RichText(
                 text: TextSpan(
                   //  style: TextStyle(color: Colors.black, fontSize: 36),

                   children: <TextSpan>[
                     TextSpan(
                         text: 'SAR ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff8F8F8F),
                             FontWeight.w400,
                             14.0)),
                     TextSpan(
                         text: '2,78,000.00 ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff000000),
                             FontWeight.w400,
                             14.0)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       SizedBox(
         height: 8,
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0, right: 12),
         child: Container(
           height: MediaQuery.of(context).size.height / 15,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               gradient: LinearGradient(colors: [
                 Color(0xffFFF5F5),
                 Color(0xffF8F8F8),
               ])),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Container(
                       width: MediaQuery.of(context).size.width /
                           12,
                       height:
                       MediaQuery.of(context).size.height /
                           20,
                       decoration: BoxDecoration(
                         color: Color(0xffFFE1E1),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: SvgPicture.asset(
                         "assets/svg/moneybag.svg",
                         width: 16,
                         height: 18,
                         color: Color(0xffA60687),
                       ),
                     ),
                   ),
                   Text(" Debit",
                       style: customisedStyleBold(context,
                           Colors.black, FontWeight.w400, 16.0)),
                 ],
               ),
               RichText(
                 text: TextSpan(
                   //  style: TextStyle(color: Colors.black, fontSize: 36),

                   children: <TextSpan>[
                     TextSpan(
                         text: 'SAR ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff8F8F8F),
                             FontWeight.w400,
                             14.0)),
                     TextSpan(
                         text: '2,78,000.00 ',
                         style: customisedStyleBold(
                             context,
                             Color(0xff000000),
                             FontWeight.w400,
                             14.0)),
                   ],
                 ),
               )
             ],
           ),
         ),
       ),
       SizedBox(
         height: 8,
       ),
       Column(
         children: [
           Text("Total Revenue",style: customisedStyleBold(context,
               Colors.black, FontWeight.w400, 16.0)),
           Container(
             padding: const EdgeInsets.all(10),
             width: double.infinity,
             height: 300,
             child: LineChart(
               LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
                 LineChartBarData(spots: [
                   const FlSpot(0, 1),
                   const FlSpot(1, 3),
                   const FlSpot(2, 10),
                   const FlSpot(3, 7),
                   const FlSpot(4, 12),
                   const FlSpot(5, 13),
                   const FlSpot(6, 17),
                   const FlSpot(7, 15),
                   const FlSpot(8, 20)
                 ])
               ]),
             ),
           ),
         ],
       ),
       SizedBox(
         height: 8,
       ),
       Column(
         children: [
           Text("Total Expense",style: customisedStyleBold(context,
               Colors.black, FontWeight.w400, 16.0)),
           Container(
             padding: const EdgeInsets.all(10),
             width: double.infinity,
             height: 300,
             child: LineChart(
               LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
                 LineChartBarData(spots: [
                   const FlSpot(0, 1),
                   const FlSpot(1, 3),
                   const FlSpot(2, 10),
                   const FlSpot(3, 7),
                   const FlSpot(4, 12),
                   const FlSpot(5, 13),
                   const FlSpot(6, 17),
                   const FlSpot(7, 15),
                   const FlSpot(8, 20)
                 ])
               ]),
             ),
           ),
         ],
       ),
       SizedBox(
         height: 8,
       ),
       Column(
         children: [
           Text("Total Profit",style: customisedStyleBold(context,
               Colors.black, FontWeight.w400, 16.0)),
           Container(
             padding: const EdgeInsets.all(10),
             width: double.infinity,
             height: 300,
             child: LineChart(
               LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
                 LineChartBarData(spots: [
                   const FlSpot(0, 1),
                   const FlSpot(1, 3),
                   const FlSpot(2, 10),
                   const FlSpot(3, 7),
                   const FlSpot(4, 12),
                   const FlSpot(5, 13),
                   const FlSpot(6, 17),
                   const FlSpot(7, 15),
                   const FlSpot(8, 20)
                 ])
               ]),
             ),
           ),
         ],
       ),
     ],
   );
  }
}
class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget(
      {Key? key, required this.currentIndex, required this.length})
      : super(key: key);

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i <= length; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: currentIndex == i ?12: 8,
            width:currentIndex == i ?12: 8,
            decoration: BoxDecoration(
                color: currentIndex == i ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(50)),
          ),
      ],
    );
  }
}

class SlideCard extends StatelessWidget {
  const SlideCard({super.key, required this.cardDetail});

  final Card cardDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.width / 4,
        child: cardDetail,
      ),

    );
  }
}
