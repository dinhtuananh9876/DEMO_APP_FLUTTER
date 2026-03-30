import 'package:flutter/material.dart';
import 'package:flutter_application_1/entities/product.dart';

class Myproduct extends StatelessWidget {
  const Myproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DANH SÁCH SẢN PHẨM'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          list_product.length,
          (index) => item(list_product[index]),
        ),
      ),
      //Column(children: List.generate(5, (iteam) => item())),
    );
  }
}

Widget item(product obj) {
  return Container(
    height: 150,
    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 172, 167, 161),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          obj.img ??
              "https://images.unsplash.com/photo-1769399287930-7cdddd98ef3a?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          width: 100,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name ${obj.name ?? 0}'),
                    Text('Unit ${obj.unit ?? 0}'),
                  ],
                ),
                Text('Price ${obj.price ?? 0}'),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            print("Bạn vừa nhấn vào lớp: ${obj.name}");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(
              255,
              10,
              105,
              200,
            ), // Màu nền nút
            foregroundColor: const Color.fromARGB(
              255,
              246,
              243,
              243,
            ), // Màu chữ trên nút
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text("Add to Cart"),
        ),
      ],
    ),
  );
}
