import '../models/product.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;

  CartService._internal();

  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void add(Product p) {
    _cart.add(p);
  }

  void remove(Product p) {
    _cart.remove(p);
  }

  void clear() {
    _cart.clear();
  }
}