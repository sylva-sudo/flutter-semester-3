import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:minggu_9/model/product.dart';
import 'package:get/get.dart';

class DemoController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0.0, (sum, element) => sum + element.price);

  addToCard(Product product) {
    cartItems.add(product);
  }

  final storage = GetStorage();
  bool get isDrak => storage.read('darkmode') ?? false;
  ThemeData get theme => isDrak ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => storage.write('darkmode', val);
}
