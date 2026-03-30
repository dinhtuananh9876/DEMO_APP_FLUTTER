import 'package:flutter/material.dart';
import 'package:flutter_application_1/entities/classromm.dart';
import 'package:flutter_application_1/entities/du_lieu_lophoc.dart';
import 'package:flutter_application_1/my_classrom.dart';

class MyLopHoc extends StatelessWidget {
  const MyLopHoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form ĐĂNG KÝ TÀI KHOẢN'),
        backgroundColor: Colors.amber,
      ),
      //
      body: ListView(
        scrollDirection: Axis.vertical, // hướng cuộn theo chiều dọc
        children: List.generate(
          list_dulieulophoc.length,
          (index) => item(list_dulieulophoc[index]),
        ),
      ),
    );
  }
}

Widget item(DuLieuLophoc obj) {
  return Container(
    height: 200,
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      //
      children: [
        // đâu là thằng bên trái
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          // trong này có 2 thằng con là comlum và một thằng tex
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  obj.tenlop ?? 'tên lớp không tồn tại',
                  style: TextStyle(fontSize: 20),
                ),
                Text(obj.phonghoc ?? "0000", style: TextStyle(fontSize: 20)),
              ],
            ),
            Text('${obj.siso ?? 0} Học Viên', style: TextStyle(fontSize: 20)),
          ],
        ),
        // đâu là thằng bên pahir
        Icon(Icons.more_horiz),
      ],
    ),
  );
}
