import 'package:get/get.dart';
import 'dart:math';

class Products extends GetxController {
  // All products
  // In production, these things usually be loaded them from API or database or something like that
  final RxList<Item> _items = List.generate(
      100,
          (index) => Item(
          id: index,
          name: 'Product $index',
          price: Random().nextDouble() * 100,
          inWishList: false.obs)).obs;

  // Use this to retrieve all products
  List<Item> get items {
    return [..._items];
  }

  // This will return the products that were added to wish list
  List<Item> get wishListItems {
    return _items.where((item) => item.inWishList.value == true).toList();
  }

  // Add an item to the wish list
  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = true;
  }

  // Remove an item from the wish list
  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = false;
  }
}



///model
class Item {
  int id;
  String name;
  double price;
  RxBool
  inWishList; // Make inWishList observable by using the RxBool type and adding ".obs" (".obs" will be added in the Products class).
  Item(
      {required this.id,
        required this.name,
        required this.price,
        required this.inWishList});
}