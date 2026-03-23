import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    List<Product> cart = CartService().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ hàng của bạn"),
        backgroundColor: Colors.amber,
      ),

      body: cart.isEmpty
          ? Center(child: Text("Bạn chưa có sản phẩm nào trong giỏ hàng"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(cart[i].name),
                        subtitle: Text("${cart[i].price}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text("Xác nhận"),
                                content: Text("Xóa sản phẩm?"),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Không")),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          CartService().remove(cart[i]);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK")),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                ElevatedButton(
                  child: Text("Thanh toán"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("Thanh toán"),
                        content: Text("Bạn đã thanh toán xong"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                CartService().clear();
                              });
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
    );
  }
}