import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/audio/service_locator.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/utils/theme/theme.dart';
import 'package:fmusic/view/navigation/navigation_barview.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: JColor.bgColor,
    systemNavigationBarIconBrightness:
        Brightness.light, // Couleur des icônes (clair ou sombre)
  ));
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  @override
void dispose() {
  getIt<PageManager>().dispose(); // ferme les streams, timers, etc.
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FMusic',
      debugShowCheckedModeBanner: false,
      theme: JAppTheme.darkTheme,
      home: NavigationBarView(),
    );
  }
}

// class MyAppControl extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     getIt<PageManager>().init();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     getIt<PageManager>().init();
//   }
// }
