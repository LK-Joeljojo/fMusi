import 'package:flutter/material.dart';
import 'package:fmusic/view_model/drawer_view_model.dart';
import 'package:fmusic/widgets/icon_text_row.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/image_asset.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  final drawerController = Get.put(DrawerViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.find<DrawerViewModel>().openDrawer();
            },
            icon: SizedBox(
              height: 35,
              width: 35,
              child: CircleAvatar(
                  backgroundColor: JColor.bgColor,
                  backgroundImage: AssetImage(HomeViewImages.profilImg)),
            )),
        title: Text("Settings", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: ListView(
        padding:  const EdgeInsets.only(top: 15,),
        children: [
        IconTextRow(icon: SettingImages.display, title: "Display"),
        IconTextRow(icon: SettingImages.headset, title: "Headset"),
        IconTextRow(icon: SettingImages.volume, title: "Audio"),
        IconTextRow(icon: SettingImages.lock, title: "Lockscreen"),
      ]),
    );
  }
}
