import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get orders {
    return [..._items];
  }

  void addOrder(List<CartItem> products, double total) {
    _items.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        products: products,
        amount: total,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
