import 'package:flutter/material.dart';
import 'package:flutter_application_1/DAINOIHUE.dart';
import 'package:flutter_application_1/lophoc.dart';
import 'package:flutter_application_1/my_classrom.dart';
import 'package:flutter_application_1/my_email.dart';
import 'package:flutter_application_1/my_layout_tuananh.dart';
import 'package:flutter_application_1/my_product.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Mylogin());
  }
}
