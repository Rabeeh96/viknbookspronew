import 'package:get/get.dart';


import '../../viknbook/dashboard/brand/brand_page.dart';
import '../../viknbook/dashboard/home_screen.dart';
import '../../viknbook/dashboard/product/product_list.dart';
import '../../viknbook/dashboard/product_category/product_category_list.dart';
import '../../viknbook/dashboard/product_group/product__group.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/Test.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.BRAND,
      page: () => BrandPage(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductLists(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CATEGORY,
      page: () => ProductCategoryList(),
    ),
    GetPage(
      name: _Paths.PRODUCT_GROUP,
      page: () => ProductGroup(),
    ),
  ];
// static final routes = [
  //   GetPage(
  //     name: _Paths.HOME,
  //     page: () =>  HomeView(),
  //     binding: HomeBinding(),
  //   ),
  //
  //   // GetPage(
  //   //   name: _Paths.INITIAL,
  //   //   page: () => InitialView(),
  //   //   binding: InitialBinding(),
  //   // ),
  // ];
}
