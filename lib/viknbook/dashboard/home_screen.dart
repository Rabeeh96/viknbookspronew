import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vikn_project_pro_new/viknbook/dashboard/payment/payment_list.dart';
import 'package:vikn_project_pro_new/viknbook/dashboard/report_page/report_page.dart';


import '../../../app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../app/modules/home/views/Test.dart';
import '../test.dart';
import 'dashboard/dash_page.dart';
import 'menu/menu_screen.dart';
import 'profile/profile_screnn.dart';
import 'quick_link/add_link.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);

  final List page = [
    DashboardPage(),

    MenuScreen(),
    ReportPage(),
  ///  ProfileHeadSection(),
    ProfileScreen(),
    AddMenuPage(),

    PaymentList(),
  ];
  Color gradient11 = const Color(0xff0A9EF3);


   void _onItemTapped(int index) {
     _selectedIndexNotifier.value = index;
   }
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
   HomeController themeChangeController = Get.put(HomeController());
   @override
   void initState() {
     getDetails();
   }
   getDetails() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();

     prefs.setString('access',"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4NDQ5MDM0LCJpYXQiOjE2OTY5MTMwMzQsImp0aSI6ImQ2NTAwMWJkYTJhYTQ1ZWVhYmQwMmYzZTA4YTFlNTk5IiwidXNlcl9pZCI6MzcxfQ.EA0IRFI7jBfvH91N3PjBFf9vBTYHFywM0ed-URWLJ3dXxKDEOZRY7Up_KbtjtF-h6uaMlU7lC2jv6I3ig8f-021cmh-7vG3dJ1xznhyp6FfKud7hR3boErRNrl7qN3kHO63m1NtrnhAfoCcAS_c2XDFVjTem7V1KPAGZmSNawmq-kOlecr-0sgRtXKd9U2ZcJsmgN4_74LvO2fpCXh9NcfzfBPkzb-FZbLSv-PsLC-hzZQzEduKc-Pj1KBGd31zCOJzPgAFzHo84UbDboRoumLKNVwveMZr9dwW-945sl63pj5TA46zH_Lk_AhXfG68w_jmzuYVt1LpyD1zoVFcnZmEGmFXMBpxvBoHF_nGcX9In0LHrmqCAq3W5Wt6yYFpSe8lpqc1wyNx8ZvRDNBDPfC6tzzGaImLmZjxX_UEW2yg-ZxfDglXzg9uVugodwFxuFGMqizWV0hA85vuLl8OgoVtkPi__63CpMCzTtH9BoTrMNvSLoNpBsXnBjBrQkJYL-xu1OoCNmqjHqEX_BQa_oO-pjn0eRknOmdrujI-O27qfFgDNE-vjwq_2a6Ur2R0gR9gNEmGdpUPT3asEKgKI3rGhoAVyEhRv8zp8-OpH8BIlSvb5DaNzWSAcFrgPaWyjARH1FMsujaQg7hhOMJrFsNdcl_1rKfESh4musRQONWU");
      prefs.setInt('user_id', 371);
     prefs.setString('companyID', "6d9ce1c8-2417-4801-b7d5-b6a814f7a1b7");
     prefs.setBool('isVat',false);
     prefs.setBool('isGst',true);

     prefs.setBool('VATDef',false);
     prefs.setBool('GSTDef',true);
     prefs.setInt('WarehouseDef',1);

   }
   @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return   ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, _) {
      return  Scaffold(

        body: page[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(

          height: mHeight / 12.5,
          child:  BottomNavigationBar(

            elevation: 0,
            type: BottomNavigationBarType.fixed,

            items: <BottomNavigationBarItem>[

              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    'assets/svg/menu_dash.svg',
                    color: _selectedIndexNotifier.value == 0
                        ? gradient11
                        : Colors.grey,
                    width: MediaQuery.of(context).size.width / 22,
                    height:
                    MediaQuery.of(context).size.height / 40,
                  ),
                ),
                label: '   Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    'assets/svg/menu_dash2.svg',
                    width: MediaQuery.of(context).size.width / 22,
                    height:
                    MediaQuery.of(context).size.height / 40,
                    color: _selectedIndexNotifier.value == 1
                        ? gradient11
                        : Colors.grey,
                  ),
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    'assets/svg/report-analytics.svg',
                    width: MediaQuery.of(context).size.width / 22,
                    height:
                    MediaQuery.of(context).size.height / 40,
                    color: _selectedIndexNotifier.value == 2
                        ? gradient11
                        : Colors.grey,
                  ),
                ),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    'assets/svg/Person.svg',
                    width: MediaQuery.of(context).size.width / 22,
                    height:
                    MediaQuery.of(context).size.height / 40,
                    color: _selectedIndexNotifier.value == 3
                        ? gradient11
                        : Colors.grey,
                  ),
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: SvgPicture.asset(
                    'assets/svg/Blank.svg',
                    height: mHeight / 50,
                  ),
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndexNotifier.value,
            showUnselectedLabels: true,
            selectedItemColor: gradient11,
            onTap: _onItemTapped,
            selectedFontSize: 10,
            unselectedFontSize: 10,

          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,
      floatingActionButton: GestureDetector(
    onTap: (){

      print("1234555555");
      Get.off(AddMenuPage());
      print("hereee");

    },
        child: Container(


          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.16,
          child: FloatingActionButton.extended(
            backgroundColor:Color(0xff0A9EF3) ,
            elevation: 0,
            onPressed: () {
              print("1234555555");
              Get.off(AddMenuPage());
              print("hereee");


            },
            label: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff0A9EF3),
              ),
              child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/svg/favorite.svg",
                    height: 20,
                    width: 25,
                  ),
                  onPressed: () {
                    Get.off(AddMenuPage());

                  }),
            ),
          ),
        ),
      ),
      );
        });
  }
}

