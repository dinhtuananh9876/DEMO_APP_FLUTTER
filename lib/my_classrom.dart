import 'package:flutter/material.dart';
import 'package:flutter_application_1/entities/classromm.dart';

class MyClassrom extends StatelessWidget {
  const MyClassrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DANH SÁCH LỚP HỌC'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          list_classroom.length,
          (index) => item(list_classroom[index], index),
        ),
      ),
      //Column(children: List.generate(5, (iteam) => item())),
    );
  }
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
    height: 150,
    margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      obj.name ?? 'ten lop khong ton tai',
                      //'LTDD - Nhom 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(obj.room ?? "0000"),
                    //Text('E4004'),
                  ],
                ),
                Text('${obj.count ?? 0}Hoc vien'),
              ],
            ),
          ],
        ),
        Icon(Icons.more_horiz),
      ],
    ),
  );
}
