import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/modules/home/controllers/home_controller.dart';
import '../../api/api_bloc/bloc/organization/organization_bloc.dart';
import '../../api/api_bloc/model/OrganizationListModelClass.dart';
import '../../custom/common_used_alerts.dart';
import '../../custom/global.dart';
import '../../custom/internet_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationPage extends StatefulWidget{
  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  late OrganizationListModelClass organizationListModelClass;
  HomeController themeChangeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    listApiFunction();
  }

  listApiFunction() async {
    if (!mounted) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final organizationId = prefs.getString("organisation");
    return BlocProvider.of<OrganizationBloc>(context).add(ListOrganizationEvent(is_mobile: true, userId: 371));

    // var netWork = await checkNetwork();
    // print("_____network  $netWork");
    // if (netWork) {
    //   if (!mounted) return;
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   final organizationId = prefs.getString("organisation");
    //   return BlocProvider.of<OrganizationBloc>(context).add(ListOrganizationEvent(is_mobile: true, userId: 371));
    // }
    // else {
    //   if (!mounted) return;
    //   msgBtmDialogueFunction(context: context, textMsg: "Check your network connection");
    // }
  }



  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
  return BlocBuilder<OrganizationBloc, OrganizationState>(
    builder: (context, state) {
      if (state is OrganizationListLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xff5728C4),
          ),
        );
      }



      if (state is OrganizationListLoaded) {
        organizationListModelClass = BlocProvider.of<OrganizationBloc>(context).organizationListModelClass;

        return organizationListModelClass.data!.isNotEmpty
            ? SafeArea(child: Scaffold(
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Organization",
                  style: customisedStyleBold(
                      context,
                      themeChangeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                      FontWeight.w500,
                      16.0),
                ),
                SvgPicture.asset(
                  'assets/svg/search.svg',
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 8),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: organizationListModelClass.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child:Padding(
                      padding: const EdgeInsets.only(bottom: 4.0,),
                      child: Column(
                        children: [
                          Container(
                            height: mHeight * .05,
                            // decoration: BoxDecoration(
                            //   border:Border(bottom: )
                            // ),
                            child:  Row(

                              children: [
                                spaceWithWidth(4),
                                ///image commented here having a null
                                CircleAvatar(
                                  backgroundColor: Colors.blue,

                                  //  backgroundImage: NetworkImage(image)
                                ),
                                //    backgroundImage:organizationListModelClass.data![index].companyLogo==''?NetworkImage('https://www.gravatar.com/avatar/$index?s=46&d=identicon&r=PG&f=1') : NetworkImage(image)),

                                spaceWithWidth(8),
                                Text(
                                  organizationListModelClass.data![index].companyName!,
                                  style: customisedStyleBold(context, themeChangeController.isDarkMode.value
                                      ? Colors.white : Colors.black, FontWeight.w500, 16.0),
                                ),
                              ],
                            ),
                          ),
                          DividerStyle(),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ))
            : SizedBox(
            height: mHeight * .7,
            child: const Center(
                child: Text(
                  "Not found !",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )));
      }
      if (state is OrganizationListError) {
        return Center(child: Text("Something went wrong"));
      }
      return SizedBox();
    },
  );
  }
}