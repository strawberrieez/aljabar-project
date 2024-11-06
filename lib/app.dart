import 'package:aljabar_project/homepage.dart';
import 'package:aljabar_project/homepage_ui.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageUi(),
    );
  }
}
