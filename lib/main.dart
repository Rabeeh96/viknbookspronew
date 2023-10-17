import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:vikn_project_pro_new/viknbook/api/api_bloc/bloc/organization/organization_bloc.dart';
import 'package:vikn_project_pro_new/viknbook/api/api_bloc/functions_api/organization.dart';

import 'app/modules/initial/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/controller/theme_controller.dart';
import 'app/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('settings');
  await Hive.openBox(
      'shopping_box'); // Open the box that will store the settings

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  OrganizationApi organizationApi = OrganizationApi();

  @override
  Widget build(BuildContext context) {
    // Createing theme instance For Getting the ThemeMode Stage from the ThemeController
    final ThemeController _themeController = Get.put(ThemeController());

    return MultiBlocProvider(
        providers: [
          BlocProvider<OrganizationBloc>(
            create: (context) => OrganizationBloc(organizationApi),
          ),
        ],
        child: GetMaterialApp(
          title: "Flutter Theme",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: InitialBinding(),
          // Initial Binding to make Sure the ThemeController is initialized
          themeMode: _themeController.themeStateFromHiveSettingBox,
          // Setting the ThemeMode from the Hive Setting Box
          theme: CustomTheme.lightTheme,
          // CustomThemeData for Light Theme
          darkTheme: CustomTheme.darkTheme, // CustomThemeData for Dark Theme
        ));
  }
}
