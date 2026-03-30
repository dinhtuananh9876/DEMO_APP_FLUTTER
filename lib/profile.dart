import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map user;

  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PROFILE")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Avatar
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user['image']),
            ),

            SizedBox(height: 20),

            // Thông tin user
            info("Username", user['username']),
            info("Email", user['email']),
            info("First Name", user['firstName']),
            info("Last Name", user['lastName']),
            info("Gender", user['gender']),
            info("ID", user['id'].toString()),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget hiển thị từng dòng
  Widget info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
