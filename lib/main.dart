import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:student_app/View/Home/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(),),
      ],
    );
  }
}

