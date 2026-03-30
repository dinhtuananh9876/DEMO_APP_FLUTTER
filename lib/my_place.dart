import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GIỚI THIỆU ĐỊA ĐIỂM'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(children: [block1(), block2(), block3(), block4()]),
      ),
    );
  }

  block1() {
    var url =
        "https://images.unsplash.com/photo-1768590342558-665aa861ed81?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

    return Image.network(url);
  }

  block2() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // chiều chính và căn giữa
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // chiều phụ căn lề trái
            children: [
              Text(
                "DAI NOI HUE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text("THANH PHO HUE", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue),
            Text("CALL"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.near_me, color: Colors.blue),
            Text("ROUTE"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE"),
          ],
        ),
      ],
    );
  }

  block4() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30, left: 30, right: 30),
      child: Text(
        "Hoàng thành Huế (chữ Hán: 皇城) hay còn được gọi là Đại Nội (大內), là vòng thành thứ hai bên trong Kinh thành Huế, có chức năng bảo vệ các cung điện quan trọng nhất của triều đình, các miếu thờ tổ tiên nhà Nguyễn và bảo vệ Tử Cấm thành - nơi dành riêng cho vua và hoàng gia. Hoàng thành và Tử Cấm thành thường được gọi chung là Đại Nội có diện tích khoảng 520ha.",
      ),
    );
  }
}
