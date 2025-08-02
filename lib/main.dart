import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FMusic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: JColor.primayColor),
        useMaterial3: true,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: JColor.bgColor,

        
      ),
    );
  }
}
