import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/view/music/artist_detail_view.dart';
import 'package:fmusic/view_model/artists_view_model.dart';
import 'package:fmusic/widgets/artists_list.dart';
import 'package:get/get.dart';

class ArtistsView extends StatelessWidget {
  ArtistsView({super.key});

  final artVM = Get.put(ArtistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
          padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: artVM.artistList.length,
          itemBuilder: (context, index) {
            final obj = artVM.artistList[index];
            return ArtistsList(
              objet: obj,
              onTapMenu: (selectIndex) {
                if (kDebugMode) {
                  print(index);
                }
              },
              onTap: (){
                Get.to(ArtistDetailView());
              },
            );
          })),
    );
  }
}
