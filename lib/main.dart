import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/utils/theme/theme.dart';
import 'package:fmusic/view/navigation/navigation_barview.dart';
import 'package:get/get.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: JColor.bgColor,
    systemNavigationBarIconBrightness: Brightness.light, // Couleur des icônes (clair ou sombre)
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FMusic',
      debugShowCheckedModeBanner: false,
      theme: JAppTheme.darkTheme,
      home:  NavigationBarView(),
    );
  }
}
