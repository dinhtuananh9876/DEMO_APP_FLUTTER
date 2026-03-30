import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Xin chao",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
          Text("Hello"),
          Icon(Icons.heart_broken, size: 140),
        ],
      ),
    );
  }
}
