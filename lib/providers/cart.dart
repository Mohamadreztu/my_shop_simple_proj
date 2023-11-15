import '../models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  void addCart(String, productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // Ketika sudah tersedia
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          qty: value.qty + 1,
          title: value.title,
        ),
      );
    } else {
      // nambah product id baru
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          qty: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }
}
