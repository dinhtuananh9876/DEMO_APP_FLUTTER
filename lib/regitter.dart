import 'package:flutter/material.dart';

class Myregister extends StatelessWidget {
  Myregister({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form ĐĂNG KÝ TÀI KHOẢN'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. Ô nhập Tên người dùng
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tên người dùng',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(), // Tạo khung viền tròn bao quanh
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25), // Khoảng cách giữa 2 ô
              // o email
              TextFormField(
                obscureText: true, // Ẩn mật khẩu bằng dấu chấm
                decoration: InputDecoration(
                  labelText: 'Nhập EMAIL',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.visibility_off), // Icon
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập EMAIL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              // 3. Ô nhập Mật khẩu
              TextFormField(
                obscureText: true, // Ẩn mật khẩu bằng dấu chấm
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off), // Icon
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
              // 4. Ô nhập lai Mật khẩu
              TextFormField(
                obscureText: true, // Ẩn mật khẩu bằng dấu chấm
                decoration: InputDecoration(
                  labelText: 'Xác Nhận Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off), // Icon
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng xác nhận mật khẩu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              // 5. Nút Đăng nhập
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Dữ liệu hợp lệ!')));

                    Future.delayed(const Duration(seconds: 1), () {
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    });
                  }
                },
                icon: Icon(Icons.login),
                label: Text('Đăng Ký'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ), // Nút rộng toàn màn hình
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Bo góc nút bấm
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
