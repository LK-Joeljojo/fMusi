import 'package:flutter/material.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/home/home_view.dart';
import 'package:fmusic/view_model/drawer_view_model.dart';
import 'package:get/get.dart';

import '../../common/color.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  var drawerVm = Get.put(DrawerViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerVm.scaffoldKey,
      drawer: Drawer(
        backgroundColor: JColor.bgColor,
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: JColor.whiteColor.withOpacity(0.3)))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                            backgroundColor: JColor.bgColor,
                            backgroundImage:
                                AssetImage(HomeViewImages.profilImg)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Joel jojo",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "309 songs",
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: JColor.whiteColor.withOpacity(0.5)),
                          ),
                          Text(
                            "17 albums",
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: JColor.whiteColor.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  )),
                  
            ),
            Column(
              children: [
                ListTile(
                  leading: Image.asset(HomeViewImages.heartOutline, width: 25, height: 25, color: JColor.whiteColor.withOpacity(0.5),),
                  title: Text("Liked titles",style:Theme.of(context).textTheme.titleSmall),
                ),
                
                ListTile(
                  leading: Image.asset(DrawerImages.paint, width: 25, height: 25, color: JColor.whiteColor,),
                  title: Text("Themes",style:Theme.of(context).textTheme.titleSmall),
                ),
                ListTile(
                  leading: Image.asset(NavigationBarImages.settingsLight, width: 25, height: 25, color: JColor.whiteColor.withOpacity(0.5),),
                  title: Text("Preferences and privacy settings",maxLines: 1,style:Theme.of(context).textTheme.titleSmall),
                  titleTextStyle: const TextStyle(
                    overflow: TextOverflow.ellipsis,    
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: TabBarView(controller: controller, children: [
        HomeView(),
        Container(),
        Container(),
      ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: JColor.bgColor, boxShadow: [
          BoxShadow(
              color: JColor.blackColor.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, -5))
        ]),
        child: BottomAppBar(
          color: JColor.bgColor,
          //height: 60,
          padding: const EdgeInsetsDirectional.only(top: 10),
          child: TabBar(
              indicatorWeight: 1,
              indicatorColor: Colors.transparent,
              controller: controller,
              labelColor: JColor.whiteColor.withOpacity(0.8),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              unselectedLabelColor: JColor.whiteColor,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              tabs: [
                Tab(
                  text: "Home",
                  icon: Image.asset(
                    selectTab == 0
                        ? NavigationBarImages.home
                        : NavigationBarImages.homeLight,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: "Songs",
                  icon: Image.asset(
                    selectTab == 1
                        ? NavigationBarImages.musique
                        : NavigationBarImages.musiqueLight,
                    width: 24,
                    height: 24,
                  ),
                ),
                Tab(
                  text: "Settings",
                  icon: Image.asset(
                    selectTab == 2
                        ? NavigationBarImages.settings
                        : NavigationBarImages.settingsLight,
                    width: 24,
                    height: 24,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
