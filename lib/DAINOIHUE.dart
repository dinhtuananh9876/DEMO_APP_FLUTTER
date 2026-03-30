import 'package:flutter/material.dart';

class MYDAINOIHUE extends StatelessWidget {
  const MYDAINOIHUE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [block1(), block2(), block3(), block4()]),
    );
  }

  block1() {
    var url =
        "https://images.unsplash.com/photo-1761839259946-2d80f8e72e18?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw4fHx8ZW58MHx8fHx8";
    return Image.network(url);
  }

  block2() {
    return Padding(
      padding: const EdgeInsetsGeometry.only(
        top: 30,
        bottom: 30,
        left: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            //
            children: [
              //
              Text("ĐẠI NỘI HUẾ"),
              Text("THÀNH PHỐ HUẾ"),
            ],
          ),
          Row(
            children: [
              //
              Text("41", style: TextStyle(fontSize: 20)),
              Icon(Icons.abc_outlined, color: Colors.amber),
            ],
          ),
        ],
      ),

      //
    );
  }

  block3() {
    return Padding(
      padding: const EdgeInsetsGeometry.only(
        top: 30,
        right: 30,
        left: 30,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.abc_outlined, color: Colors.blueAccent),
              Text("hàng 1"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.abc_rounded, color: Colors.amber),
              Text("hàng 2"),
            ],
          ),
          Column(
            children: [
              Icon(Icons.abc_rounded, color: Colors.amber),
              Text("hàng 3"),
            ],
          ),
        ],
      ),
    );
  }

  block4() {
    return Padding(
      padding: EdgeInsetsGeometry.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("tuan anh"), Icon(Icons.ac_unit)],
      ),
    );
  }
}
