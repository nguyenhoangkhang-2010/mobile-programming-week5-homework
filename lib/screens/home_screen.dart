import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../screens/splash_screen.dart';
import '../services/cart_service.dart';
import '../screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: "Điện thoại 01", desc: "Samsung", price: 1200, image: ""),
    Product(name: "Điện thoại 02", desc: "Xiaomi", price: 200, image: ""),
    Product(name: "Điện thoại 03", desc: "iPhone", price: 2000, image: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cửa hàng điện thoại"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("User")),
            ListTile(
              title: Text("Cửa hàng"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Giỏ hàng"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Thoát"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => SplashScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}