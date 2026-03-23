import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(child: Icon(Icons.phone_android, size: 80)),
          Text(product.name),
          Text("${product.price}"),
          ElevatedButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Xác nhận"),
                  content: Text("Bạn vừa thêm sản phẩm vào giỏ hàng?"),
                  actions: [
                    TextButton(
                      child: Text("Không"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text("Đồng ý"),
                      onPressed: () {
                        CartService().add(product);
                        Navigator.pop(context);
                      },
                    ),
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