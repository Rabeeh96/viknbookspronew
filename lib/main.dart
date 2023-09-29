import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard/Main_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      title: 'My App',
      home:  ViknBooksMainScreen(),
      // initialRoute: "/",
      // getPages: [
      //   GetPage(name: ViknBooksMainScreen.routeName, page: () =>  ViknBooksMainScreen()),
      // //   GetPage(
      // //       name: NavigationScreen.routeName,
      // //       page: () => const NavigationScreen())
      // // ],
    );
  }
}
