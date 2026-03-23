import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 120),
            SizedBox(height: 20),
            Text("Cửa hàng điện thoại", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("HUIT - TP.HCM"),
            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}