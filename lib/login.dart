import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_layout_tuananh.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/regitter.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  // Tạo một "chìa khóa" để quản lý và kiểm tra lỗi
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // Hàm xử lý logic đăng nhập
  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final dio = Dio(); //tạo Dio

      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final result = response.data; // dữ liệu user + token

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyLayoutTuananh(user: result),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sai tài khoản hoặc lỗi API!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Đăng nhập'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Ô username
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Tên người dùng',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),

              SizedBox(height: 50),

              // Ô password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),

              SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: login, //
                      icon: Icon(Icons.login),
                      label: Text('ĐĂNG NHẬP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Myregister()),
                        );
                      },
                      icon: Icon(Icons.app_registration),
                      label: Text('REGISTER'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
