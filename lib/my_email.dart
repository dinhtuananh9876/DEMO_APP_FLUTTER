import 'package:flutter/material.dart';
import 'package:flutter_application_1/entities/email.dart';

class MyEmail extends StatelessWidget {
  const MyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FloattingButtton
      floatingActionButton: FloatingActionButton.extended(
        //
        onPressed: () {},
        icon: Icon(Icons.edit),
        label: Text("Soan thư"),
      ),

      //
      //bottom
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: ""),
        ],
      ),
      body: ListView(
        children: [
          header(context),
          ...List.generate(
            list_mail.length,
            (index) => item(list_mail[index], index),
          ),
        ],
      ),
    );
  }

  Widget item(Mail obj, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          // avatar từ dữ liệu
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(obj.avatar ?? ""),
          ),
          //
          const SizedBox(width: 10),

          // nội dung
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  obj.ten ?? "",
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //
                const SizedBox(height: 3),
                //
                Text(
                  obj.tieude ?? "",
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //
                const SizedBox(height: 3),
                //
                Text(obj.noidung ?? "", maxLines: 1),
              ],
            ),
          ),

          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                obj.time ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}

// HEADER
Widget header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                // để mở Drawer
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),

            const SizedBox(width: 10),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 140,
                vertical: 10,
              ),

              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 161, 151, 151),
                borderRadius: BorderRadius.circular(30),
              ),

              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("Tìm trong thư"),
                ],
              ),
            ),
          ],
        ),

        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1761839258803-21515f43190c?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDF8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D",
          ),
        ),
      ],
    ),
  );
}
