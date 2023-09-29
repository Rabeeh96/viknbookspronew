import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

import '../custom/global.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

///calender touch chytha data label kanikkanm with a line
class _DashboardPageState extends State<DashboardPage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 1.1);
  int currentIndex = 0;
  String dayDropDownValue = 'This Month';
  var days = [
    'This Month',
    'This Day',
    'This Week',
    'This Year',
  ];

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1924, 400),
      ChartData(1925, 410),
      ChartData(1926, 405),
      ChartData(1927, 410),
      ChartData(1928, 350),
      ChartData(1929, 370),
      ChartData(1930, 500),
      ChartData(1931, 390),
      ChartData(1932, 450),
      ChartData(1933, 440),
    ];

    List<Widget> items = [
      SlideCard(
          cardDetail: Card(
        ///  #FFF9BE, #FFFFFF00
        color:Get.isDarkMode?  Color(0xffF0F0F0):Color(0xff061421),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //       Color(0xffFFF9BE)   ,
            //       Color(0xffFFFFFF)   ,
            //
            //     ]
            //     )
            // ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Color(0xffEEEBD8),
                        ),
                        spaceWithWidth(8),
                        Text(
                          "Call Suhail for discussing Step \ncounting app.",
                          style: customisedStyleBold(
                              context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w500, 14.0),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
                const Divider(
                  color: Color(0xffE8E8E8),
                  thickness: .5,
                ),
                const Text(
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
                        SvgPicture.asset(
                          "assets/svg/calendar.svg",
                            width: MediaQuery.of(context).size.width / 20,
                            height:MediaQuery.of(context).size.height / 35,
                        ),
                        spaceWithWidth(6),
                        const Text("12/09/2023",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 26,
                      decoration: BoxDecoration(
                          color: const Color(0xffE84444),
                          borderRadius: BorderRadius.circular(28)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("High",
                            style: customisedStyleBold(
                                context,
                                const Color(0xffffffff),
                                FontWeight.w400,
                                11.0)),
                      ),
                    )
                  ],
                ),
                spaceWithHeight(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/clock.svg",
                          width: MediaQuery.of(context).size.width / 20,
                          height:MediaQuery.of(context).size.height / 35,
                        ),
                        spaceWithWidth(6),
                        const Text("12.00",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Savad  ",
                          style: customisedStyleBold(
                              context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0),
                        ),
                        const Icon(Icons.person),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
      SlideCard(
          cardDetail: Card(
            color:Get.isDarkMode?  Color(0xffF0F0F0):Color(0xff061421),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color(0xffEEEBD8),
                      ),
                      spaceWithWidth(8),
                      Text(
                        "Call Suhail for discussing Step \ncounting app.",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w500, 14.0),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              ),
              const Divider(
                color: Color(0xffE8E8E8),
                thickness: .5,
              ),
              const Text(
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
                      SvgPicture.asset(
                        "assets/svg/calendar.svg",
                        width: 16,
                        height: 18,
                      ),
                      spaceWithWidth(6),
                      const Text("12/09/2023",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 26,
                    decoration: BoxDecoration(
                        color: const Color(0xffE84444),
                        borderRadius: BorderRadius.circular(28)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("High",
                          style: customisedStyleBold(context,
                              const Color(0xffffffff), FontWeight.w400, 11.0)),
                    ),
                  )
                ],
              ),
              spaceWithHeight(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/clock.svg",
                        width: 16,
                        height: 18,
                      ),
                      spaceWithWidth(6),
                      const Text("12.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Savad  ",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0),
                      ),
                      const Icon(Icons.person),
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
            color:Get.isDarkMode?  Color(0xffF0F0F0):Color(0xff061421),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Color(0xffEEEBD8),
                      ),
                      spaceWithWidth(8),
                      Text(
                        "Call Suhail for discussing Step \ncounting app.",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w500, 14.0),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              ),
              const Divider(
                color: Color(0xffE8E8E8),
                thickness: .5,
              ),
              const Text(
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
                      SvgPicture.asset(
                        "assets/svg/calendar.svg",
                        width: 16,
                        height: 18,
                      ),
                      spaceWithWidth(6),
                      const Text("12/09/2023",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 26,
                    decoration: BoxDecoration(
                        color: const Color(0xffE84444),
                        borderRadius: BorderRadius.circular(28)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("High",
                          style: customisedStyleBold(context,
                              const Color(0xffffffff), FontWeight.w400, 11.0)),
                    ),
                  )
                ],
              ),
              spaceWithHeight(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/clock.svg",
                        width: 16,
                        height: 18,
                      ),
                      spaceWithWidth(6),
                      const Text("12.00",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Savad  ",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0),
                      ),
                      const Icon(Icons.person),
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

    final List<Color> color = <Color>[];

    color.add(Color(0xffE1F8FF));
    color.add(Color(0xff69B7FF));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(1.5);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: ListView(
        children: [
          const Divider(
            color: Color(0xffE8E8E8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: Color(0xffF4F4F4),
                weight: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 6),
                child: Text(
                  "Organization",
                  style: customisedStyleBold(
                      context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0),
                ),
              ),
            ],
          ),
          const Divider(
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
                    context,Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4.3,
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
                      return items[index];
                    },
                  ),
                ),
                spaceWithHeight(16),
                IndicatorWidget(
                  currentIndex: currentIndex,
                  length: items.length - 1,
                ),
              ],
            ),
          ),
          Center(
            child: Text("view all actvities",
                style: customisedStyleBold(
                    context, const Color(0xff379FFF), FontWeight.w400, 14.0)),
          ),
          spaceWithHeight(12),
          const Divider(
            color: Color(0xffE8E8E8),
          ),
          spaceWithHeight(6),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Overview",
                  style: customisedStyleBold(
                      context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
            ),
          ),
          spaceWithHeight(10),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: Get.isDarkMode? LinearGradient(colors: [
                  Color(0xffF0F9FC),
                  Color(0xffF8F8F8),
                ]):LinearGradient(colors: [


    Color(0xff061421),
    Color(0xff061421),
    ]
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9F6FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/svg/moneybag.svg",
                            width: MediaQuery.of(context).size.width / 20,
                            height:MediaQuery.of(context).size.height / 25,
                            color: const Color(0xff065B76),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Revenue",
                            style: customisedStyleBold(
                                context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                        RichText(
                          text: TextSpan(
                            //  style: TextStyle(color: Colors.black, fontSize: 36),

                            children: <TextSpan>[
                              TextSpan(
                                  text: '+21%  ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff199E56),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'than last month.',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
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
                    //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(context,
                              const Color(0xff8F8F8F), FontWeight.w400, 14.0)),
                      TextSpan(
                          text: '2,78,000.00 ',
                          style: customisedStyleBold(context,
                               Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          spaceWithHeight(8),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: Get.isDarkMode? LinearGradient(colors: [
                  Color(0xffFFF5F5),
                  Color(0xffF8F8F8),
                ]):LinearGradient(colors: [


                  Color(0xff061421),
                  Color(0xff061421),
                ]
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFE1E1),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/svg/moneybag.svg",
                            width: MediaQuery.of(context).size.width / 20,
                            height:MediaQuery.of(context).size.height / 25,
                            color: const Color(0xff9B0404),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Expense",
                            style: customisedStyleBold(
                                context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                        RichText(
                          text: TextSpan(
                            //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                            children: <TextSpan>[
                              TextSpan(
                                  text: '+21%  ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff9B0404),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'than last month.',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
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
                    //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(context,
                              const Color(0xff8F8F8F), FontWeight.w400, 14.0)),
                      TextSpan(
                          text: '2,78,000.00 ',
                          style: customisedStyleBold(context,
                               Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          spaceWithHeight(8),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: Get.isDarkMode? LinearGradient(colors: [
                  Color(0xffF1FCF0),
                  Color(0xffF8F8F8),
                ]):LinearGradient(colors: [


                  Color(0xff061421),
                  Color(0xff061421),
                ]
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffE0F5E2),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/svg/moneybag.svg",
    width: MediaQuery.of(context).size.width / 20,
    height:MediaQuery.of(context).size.height / 25,
                            color: const Color(0xff046C0D),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Profit",
                            style: customisedStyleBold(
                                context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                        RichText(
                          text: TextSpan(
                            //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                            children: <TextSpan>[
                              TextSpan(
                                  text: '+21%  ',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff9B0404),
                                      FontWeight.w400,
                                      14.0)),
                              TextSpan(
                                  text: 'than last month.',
                                  style: customisedStyleBold(
                                      context,
                                      const Color(0xff8F8F8F),
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
                    //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(context,
                              const Color(0xff8F8F8F), FontWeight.w400, 14.0)),
                      TextSpan(
                          text: '2,78,000.00 ',
                          style: customisedStyleBold(context,
                               Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          spaceWithHeight(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Get.isDarkMode?Color(0xffF2F2F2): Color(0xff061421),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 11,
                              height: MediaQuery.of(context).size.height / 24,
                              decoration: BoxDecoration(
                                color: const Color(0xffE4EDFF),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.asset(
                                  "assets/svg/building-bank.svg",
                                  width: MediaQuery.of(context).size.width / 20,
                                  height:MediaQuery.of(context).size.height / 25,
                                  color: Color(0xff072658),
                                ),
                              )),
                        ),
                        Text(" Bank",
                            style: customisedStyleBold(
                                context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                        text: TextSpan(
                          //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

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
                                     Get.isDarkMode?Colors.black:Colors.white,
                                    FontWeight.w400,
                                    14.0)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Get.isDarkMode?Color(0xffF2F2F2):Color(0xff061421),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 11,
                            height: MediaQuery.of(context).size.height / 24,
                            decoration: BoxDecoration(
                              color: const Color(0xffC2FFD0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(
                                "assets/svg/cash.svg",
                                color: Color(0xff354052),
                                width: MediaQuery.of(context).size.width / 20,
                                height:MediaQuery.of(context).size.height / 25,
                              ),
                            ),
                          ),
                        ),
                        Text(" Cash",
                            style: customisedStyleBold(
                                context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                        text: TextSpan(
                          //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                          children: <TextSpan>[
                            TextSpan(
                                text: 'SAR ',
                                style: customisedStyleBold(
                                    context,
                                    const Color(0xff8F8F8F),
                                    FontWeight.w400,
                                    13.0)),
                            TextSpan(
                                text: '2,78,000. ',
                                style: customisedStyleBold(
                                    context,
                                     Get.isDarkMode?Colors.black:Colors.white,
                                    FontWeight.w400,
                                    13.0)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          spaceWithHeight(8),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: Get.isDarkMode? LinearGradient(colors: [
                  Color(0xffF0F4FC),
                  Color(0xffF8F8F8),
                ]):  LinearGradient(colors: [


                  Color(0xff061421),
                  Color(0xff061421),
                ]
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffDEE5FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/svg/cash-banknote.svg",
                            width: MediaQuery.of(context).size.width / 20,
                            height:MediaQuery.of(context).size.height / 25,
                            color: Color(0xff10336D),
                          ),
                        ),
                      ),
                    ),
                    Text(" Credit",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(context,
                              const Color(0xff8F8F8F), FontWeight.w400, 14.0)),
                      TextSpan(
                          text: '2,78,000.00 ',
                          style: customisedStyleBold(context,
                               Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          spaceWithHeight(8),
          Container(
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: Get.isDarkMode? LinearGradient(colors: [
                  Color(0xffF1FCF0),
                  Color(0xffFCF0F7),
                  Color(0xffF8F8F8),
                ]):  LinearGradient(colors: [


                  Color(0xff061421),
                  Color(0xff061421),
                ]
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 11,
                        height: MediaQuery.of(context).size.height / 24,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFE0F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/svg/cash-banknote.svg",
                            width: MediaQuery.of(context).size.width / 20,
                            height:MediaQuery.of(context).size.height / 25,
                          ),
                        ),
                      ),
                    ),
                    Text(" Debit",
                        style: customisedStyleBold(
                            context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAR ',
                          style: customisedStyleBold(context,
                              const Color(0xff8F8F8F), FontWeight.w400, 14.0)),
                      TextSpan(
                          text: '2,78,000.00 ',
                          style: customisedStyleBold(context,
                               Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 14.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Total Revenue",
                  style: customisedStyleBold(
                      context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE8E8E8))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2, bottom: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' SAR ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00 ',
                                      style: customisedStyleBold(
                                          context,
                                           Get.isDarkMode?Colors.black:Colors.white,
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: '+21%  ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff9B0404),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: 'than last month.',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 24,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode? Color(0xffEBEBEB):Color(0xff1C3347),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                              underline: Container(
                                height: 0,
                              ),
                              icon: null,
                              value: dayDropDownValue,
                              items: days.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items + "",
                                    style: customisedStyleBold(context,
                                        Get.isDarkMode?Colors.black:Colors.white, FontWeight.normal, 11.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async {
                                setState(() {
                                  dayDropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: SfCartesianChart(series: <ChartSeries>[
                        SplineAreaSeries<ChartData, int>(
                            dataSource: chartData,
                            splineType: SplineType.cardinal,
                            cardinalSplineTension: 0.9,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            gradient: gradientColors)
                      ])),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Total Expense",
                  style: customisedStyleBold(
                      context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
            ),
          ),
          spaceWithHeight(8),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE8E8E8))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2, bottom: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' SAR ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00 ',
                                      style: customisedStyleBold(
                                          context,
                                           Get.isDarkMode?Colors.black:Colors.white,
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: '+21%  ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff9B0404),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: 'than last month.',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 24,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode? Color(0xffEBEBEB):Color(0xff1C3347),

                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                              underline: Container(
                                height: 0,
                              ),
                              icon: null,
                              value: dayDropDownValue,
                              items: days.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items + "",
                                    style: customisedStyleBold(context,
                                        Get.isDarkMode?Colors.black:Colors.white, FontWeight.normal, 11.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async {
                                setState(() {
                                  dayDropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: SfCartesianChart(series: <ChartSeries>[
                        SplineAreaSeries<ChartData, int>(
                            dataSource: chartData,
                            splineType: SplineType.cardinal,
                            cardinalSplineTension: 0.9,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            gradient: gradientColors)
                      ])),
                ],
              ),
            ),
          ),
          spaceWithHeight(8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Total Revenue",
                  style: customisedStyleBold(
                      context, Get.isDarkMode?Colors.black:Colors.white, FontWeight.w400, 16.0)),
            ),
          ),
          spaceWithHeight(8),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffE8E8E8))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2, bottom: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' SAR ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: '2,78,000.00 ',
                                      style: customisedStyleBold(
                                          context,
                                           Get.isDarkMode?Colors.black:Colors.white,
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                //  style: TextStyle(color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 36),

                                children: <TextSpan>[
                                  TextSpan(
                                      text: '+21%  ',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff9B0404),
                                          FontWeight.w400,
                                          14.0)),
                                  TextSpan(
                                      text: 'than last month.',
                                      style: customisedStyleBold(
                                          context,
                                          const Color(0xff8F8F8F),
                                          FontWeight.w400,
                                          14.0)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 24,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode? Color(0xffEBEBEB):Color(0xff1C3347),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButton(
                              underline: Container(
                                height: 0,
                              ),
                              icon: null,
                              value: dayDropDownValue,
                              items: days.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items + "",
                                    style: customisedStyleBold(context,
                                        Get.isDarkMode?Colors.black:Colors.white, FontWeight.normal, 11.0),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) async {
                                setState(() {
                                  dayDropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: SfCartesianChart(series: <ChartSeries>[
                        SplineAreaSeries<ChartData, int>(
                            dataSource: chartData,
                            splineType: SplineType.cardinal,
                            cardinalSplineTension: 0.9,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            gradient: gradientColors)
                      ])),
                ],
              ),
            ),
          ),
          spaceWithHeight(8),
        ],
      ),
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
            height: currentIndex == i ? 12 : 8,
            width: currentIndex == i ? 12 : 8,
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

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}
