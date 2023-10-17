import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



import '../../../app/modules/home/controllers/home_controller.dart';
import '../../custom/global.dart';
import 'package:get/get.dart';

import '../brand/brand_page.dart';
import '../contacts/customer/customer_create.dart';
import '../contacts/supplier/supplier_create.dart';
import '../journal/list_journal_entry.dart';
import '../payment/detail_page.dart';
import '../payment/payment_list.dart';
import '../product/product_list.dart';
import '../product_category/product_category_list.dart';
import '../product_group/product__group.dart';
import '../purchase/purchase_list.dart';
import '../sales/create_sale.dart';
import '../sales/sales_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

///list
///raz
class _MenuScreenState extends State<MenuScreen> {
  List financeimg = [
    "assets/new/pymt.png",
    "assets/png/receipt.png",
    "assets/new/jourl.png",
    "assets/new/tax.png",
    "assets/new/epns.png"
  ];
  List financeText = ["Payment", "Receipt", "Journal", "Tax", "Expense"];
  List saleImg = [
    "assets/new/salesestimate.png",
    "assets/new/salesorder.png",
    "assets/new/salesinvoice.png",
    "assets/new/salesReturn.png",
  ];
  List saleText = [
    "Sales Estimate",
    "Sales Order",
    "Sales Invoice",
    "Sales Return",
  ];
  List saleNavigation = [
    SalesList(),
    SalesInvoice(),
    SalesList(),
    SalesList(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getAccount();
    getProducts();
    super.initState();
  }

  List purchaseImg = [
    "assets/new/purorder.png",
    "assets/new/purInvoice.png",
    "assets/new/purReturn.png",
  ];
  List purchaseText = [
    "Pur. Order",
    "Pur. Invoice",
    "Pur. Return",
  ];

  List productImg = [
    "assets/new/brand.png",
    "assets/new/productgroup.png",
    "assets/new/category.png",
    "assets/new/products.png",
  ];

  List productText = [
    "Brand",
    "Product Group",
    "Category",
    "Products",
  ];
  List pImg = [
    "assets/new/rte.png",
    "assets/new/unit.png",
    "assets/new/stockorder.png",
    "assets/new/stockorder.png",
    "assets/new/stockorder.png",
    "assets/new/stockorder.png",
    "assets/new/stockorder.png",
  ];

  List pText = [
    "Route",
    "Warehouse",
    "Unit",
    "Stock Order",
    "Stock Transfer",
    "Management",
    "Opening Stock",
  ];

  Future getAccount() async {
    var responseJson = [
      {
        "value": "assets/svg/ledger.svg",
        "name": "  Ledgers",
        "navigation": "nav",
      },
      {
        "value": "assets/svg/contact.svg",
        "name": "   Contact",
        "navigation": "nav",
      },
    ];

    for (Map user in responseJson) {
      accountModelClass.add(AccountModelClass.fromJson(user));
    }
  }

  Future getProducts() async {
    var responseJson = [
      {
        "value": "assets/svg/brands.svg",
        "name": "  Brands",
        "navigation": "/_Paths.BRAND",
      },
      {
        "value": "assets/svg/product_group.svg",
        "name": "Product Group",
        "navigation": "/_Paths.PRODUCT_GROUP",
      },
      {
        "value": "assets/svg/product_category.svg",
        "name": "Product Category",
        "navigation": "_Paths.PRODUCT_CATEGORY",
      },
      {
        "value": "assets/svg/products1.svg",
        "name": "Products",
        "navigation": "_Paths.PRODUCT",
      }
    ];

    for (Map user in responseJson) {
      productModelClass.add(ProductModelClass.fromJson(user));
    }
  }

  Future getPurchase() async {
    // var responseJson=  {
    //     "account": [
    // {
    //   "value": "assets/svg/ledger.svg",
    //   "name": "  Ledgers",
    //   "navigation": "nav"
    // },
    // {
    //   "value": "assets/svg/contact.svg",
    //   "name": "   Contact",
    //   "navigation": "nav"
    // }
    //   ],
    //   "purchase": [
    // {
    //   "value": "assets/svg/ledger.svg",
    //   "name": "  Purchase",
    //   "navigation": "nav"
    // }
    //   ]
    // };
    //   for (Map user in responseJson) {
    //     menuList.add(MenuModelClass.fromJson(user));
    //   }
  }

  HomeController themeChangeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                "Menu",
                style: customisedStyleBold(
                    context,
                    themeChangeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                    FontWeight.w500,
                    16.0),
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svg/search.svg',
                  )),
            ],
          ),
        ),
        body: Container(
            height: mHeight,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  DividerStyle(),
                  spaceWithHeight(4),
                  TextWidget(
                    mHeight: mHeight,
                    text: "Accounts",
                  ),
                  Container(
                      margin: EdgeInsets.only(left: mWidth * .04),
                      alignment: Alignment.centerLeft,
                      height: mHeight * .09,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: accountModelClass.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: GestureDetector(
                                onTap: (){
                                  navToAccounts(index);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: mWidth * .04),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SvgPicture.asset(
                                        accountModelClass[index].value,
                                        fit: BoxFit.fitHeight,
                                        width:
                                        MediaQuery.of(context).size.width / 5,
                                        height:
                                        MediaQuery.of(context).size.height / 15,
                                      ),
                                    ),
                                    Text(
                                      accountModelClass[index].name,
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          10.0),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  DividerStyle(),
                  TextWidget(
                    mHeight: mHeight,
                    text: "Finances",
                  ),
                  Container(
                    //  color: Colors.red,
                    padding: EdgeInsets.only(
                        left: mWidth * .05, right: mWidth * .05),
                    height: mHeight * .25,

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: financeimg.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 80, // here set custom Height You Want
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navToFinance(index);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // padding: EdgeInsets.only(left: mWidth*.04),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    financeimg[index],
                                    fit: BoxFit.fitHeight,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                  ),
                                ),
                                Text(
                                  financeText[index],
                                  style: customisedStyleBold(
                                      context,
                                      themeChangeController.isDarkMode.value
                                          ? Colors.white
                                          : Colors.black,
                                      FontWeight.w400,
                                      10.0),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  //SizedBox(height: mHeight*.03,),
                  DividerStyle(),
                  TextWidget(
                    mHeight: mHeight,
                    text: "Sales",
                  ),
                  Container(
                    //  color: Colors.red,
                    padding: EdgeInsets.only(
                        left: mWidth * .05, right: mWidth * .05),
                    height: mHeight * .10,

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: saleImg.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 80, // here set custom Height You Want
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navToSale(index);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: EdgeInsets.only(left: mWidth*.04),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(saleImg[index],
                                      fit: BoxFit.fitHeight,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      saleText[index],
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          10.0),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  DividerStyle(),
                  TextWidget(
                    mHeight: mHeight,
                    text: "Purchase",
                  ),
                  Container(
                    //  color: Colors.red,
                    padding: EdgeInsets.only(
                        left: mWidth * .05, right: mWidth * .05),
                    height: mHeight * .11,

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: purchaseImg.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 5,
                          mainAxisExtent:
                              100, // here set custom Height You Want
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navToPurchase(index);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: EdgeInsets.only(left: mWidth*.04),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(purchaseImg[index],
                                      fit: BoxFit.fitHeight,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      purchaseText[index],
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          10.0),
                                    ))
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  DividerStyle(),
                  TextWidget(
                    mHeight: mHeight,
                    text: "Products",
                  ),
                  Container(
                    //  color: Colors.red,
                    padding: EdgeInsets.only(
                        left: mWidth * .05, right: mWidth * .05),
                    height: mHeight * .12,

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productModelClass.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 5,
                          mainAxisExtent:
                              100, // here set custom Height You Want
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navToProduct(index);
                            },
                            // onTap: () => Get.toNamed(productModelClass[index].navigation,
                            // ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SvgPicture.asset(
                                        productModelClass[index].value,
                                        fit: BoxFit.fitHeight,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      productModelClass[index].name,
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          10.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: mHeight * .03,
                  ),
                  DividerStyle(),

                  TextWidget(
                    mHeight: mHeight,
                    text: "Inventory",
                  ),
                  Container(
                    //  color: Colors.red,
                    padding: EdgeInsets.only(
                        left: mWidth * .05, right: mWidth * .05),

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        //physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: pImg.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 90, // here set custom Height You Want
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(pImg[index],
                                      fit: BoxFit.fitHeight,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15),
                                ),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      pText[index],
                                      style: customisedStyleBold(
                                          context,
                                          themeChangeController.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                          FontWeight.w400,
                                          10.0),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            )));
  }
  navToAccounts(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateCustomer()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SupplierCreate()),
      );
    } else {}
  }

  navToProduct(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BrandPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductGroup()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductCategoryList()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductLists()),
      );
    } else {}
  }

  navToFinance(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentList()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => JournalList()),
      );
    } else {}
  }

  navToSale(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SalesList()),
      );
    } else {}
  }

  navToPurchase(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PurchaseList()),
      );
    } else {}
  }
}

List<AccountModelClass> accountModelClass = [];

class AccountModelClass {
  final String value, name, navigation;

  AccountModelClass({
    required this.value,
    required this.name,
    required this.navigation,
  });

  factory AccountModelClass.fromJson(Map<dynamic, dynamic> json) {
    return AccountModelClass(
      value: json['value'],
      name: json['name'],
      navigation: json['navigation'],
    );
  }
}

List<ProductModelClass> productModelClass = [];

class ProductModelClass {
  final String value, name, navigation;

  ProductModelClass({
    required this.value,
    required this.name,
    required this.navigation,
  });

  factory ProductModelClass.fromJson(Map<dynamic, dynamic> json) {
    return ProductModelClass(
      value: json['value'],
      name: json['name'],
      navigation: json['navigation'],
    );
  }
}
