import 'package:flutter/material.dart';
import 'package:flutter_application_1/entities/classromm.dart';
import 'package:flutter_application_1/my_classrom.dart';
import 'package:flutter_application_1/my_email.dart';
import 'package:flutter_application_1/my_list_stack.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/my_place.dart';
import 'package:flutter_application_1/my_product.dart';
import 'package:flutter_application_1/my_product_moi.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/regitter.dart';

class MyLayoutTuananh extends StatelessWidget {
  final Map user;

  const MyLayoutTuananh({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //gọi hàm drawer để tạo menu
      drawer: drawView(context),

      //
      body: ListView(
        children: [
          header(context),
          ...List.generate(
            list_classroom.length,
            (index) => item(list_classroom[index], index),
          ),
        ],
      ),
    );
  }

  Widget item(Classromm obj, int index) {
    List<Color> colors = [
      Colors.orange,
      Colors.blue,
      Colors.red,
      Colors.teal,
      Colors.green,
    ];
    // chọn màu thêo danh sách
    Color bgColor = colors[index % colors.length];
    return Container(
      height: 120,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        // màu nền
        color: bgColor,
        // bo góc
        borderRadius: BorderRadius.circular(20),
      ),
      // hướng chính
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // cách đều nội dung 2 bên
        // con
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // căn chữ sang trái
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                obj.name ?? "lớp chưa có tên",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // tạo khoảng cách
              const SizedBox(height: 5),
              // dòng text
              Text(
                // hiển thi phòng học
                obj.room ?? "không có phòng học",

                // style
                style: const TextStyle(color: Colors.white),
              ),
              // tạo khoảng cách
              const SizedBox(height: 5),
              // số sinh viên
              Text(
                // hiển thi SINH VIÊN
                "${obj.count ?? 0} SINH VIÊN",

                // style
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),

          // ICON 3 CHẤM BÊN PHẢI
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }

  // xây dựng phần header
  Widget header(BuildContext context) {
    return Padding(
      // khoảng cách xung quanh header
      padding: const EdgeInsets.all(20),
      // hướng chính
      child: Row(
        //chia đều sang 2 bên
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        // con
        children: [
          // bên trái
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  // để mở drawer
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),

              // toạ khoảng cách
              const SizedBox(width: 10),
              const Text(
                "DANH SÁCH LỚP",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // thành phần bên phải
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: user),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(user['image']),
                ),
              ),
              // tạo khoảng cách
              const SizedBox(width: 5),
              IconButton(icon: const Icon(Icons.add), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  // tạo DRAWER MENU
  Widget drawView(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Danh sách các chức năng",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Lớp học"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyClassrom()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text("Danh sách khách sạn"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyListStack()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Danh sách sản phẩm promax"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductApiPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("ĐĂNG NHẬP"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mylogin()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text("ĐỊA ĐIỂM"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPlace()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.accessibility_new),
            title: const Text("ĐĂNG KÝ TÀI KHOẢN"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Myregister()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.store),
            title: const Text("DANH SÁCH CỬA HÀNG"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Myproduct()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.account_tree),
            title: const Text("EMAIL"),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyEmail()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("ĐĂNG XUẤT"),

            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Mylogin()),
                (route) => false, // ❌ xoá toàn bộ stack
              );
            },
          ),
        ],
      ),
    );
  }
}
