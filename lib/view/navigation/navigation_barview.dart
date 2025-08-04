import 'package:flutter/material.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/home/home_view.dart';

import '../../common/color.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> with SingleTickerProviderStateMixin{
  TabController? controller;
  int selectTab = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3,vsync: this);

    controller?.addListener((){
      selectTab = controller?.index ?? 0;
      setState(() {
        
      });
    });

  }
  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: 
      [
       const HomeView(),
        Container(),
        Container(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: JColor.bgColor.withOpacity(0.80),
        child: TabBar(
          indicatorWeight: 1,
          indicatorColor: Colors.transparent,
          controller: controller,
          labelColor: JColor.whiteColor.withOpacity(0.8),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
          unselectedLabelColor: JColor.whiteColor,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 10

          ),
          
          tabs: [
          Tab(
            text: "Home",
            icon: Image.asset(
              selectTab == 0 ? NavigationBarImages.home : NavigationBarImages.homeLight,
              width: 24,
              height: 24,
            ),
          ),
            Tab(
            text: "Songs",
            icon: Image.asset(
              selectTab == 1 ? NavigationBarImages.musique : NavigationBarImages.musiqueLight,
              width: 24,
              height: 24,
            ),
          ),  Tab(
            text: "Settings",
            icon: Image.asset(
              selectTab == 2 ? NavigationBarImages.settings : NavigationBarImages.settingsLight,
              width: 24,
              height: 24,
            ),
          ),
        ]),
      ),
    );
  }
}