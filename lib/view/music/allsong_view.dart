import 'package:flutter/material.dart';
import 'package:fmusic/view_model/allsong_view_model.dart';
import 'package:fmusic/widgets/allsong_row.dart';
import 'package:get/get.dart';

class AllsongView extends StatelessWidget {
  AllsongView({super.key});
  final allSC = Get.put(AllsongViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: allSC.allSongs.length,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final obj = allSC.allSongs[index];
              return Column(
                children: [
                  AllsongRow(
                    objet: obj,
                    onTap: (){},
                  ),
                ],
              );
            });
      }),
    );
  }
}
