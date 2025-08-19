

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/view_model/albums_view_model.dart';
import 'package:fmusic/widgets/albums_song.dart';
import 'package:get/get.dart';

class AlbumsView extends StatelessWidget {
   AlbumsView({super.key});

  final aVM = Get.put(AlbumsViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var typeWidth = (media.width - 60) * 0.5;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 15,                
                  childAspectRatio: typeWidth / (typeWidth + 45),
                ),
                itemCount: aVM.albumsType.length,
                itemBuilder: (context, index) {
                  final obj = aVM.albumsType[index];
                  return AlbumsSong(objet: obj, onTapMenu: (selectIndex) {
                    if(kDebugMode){
                      print(index);
                    }
                  },);
                  
                })),
            
            
          ],
        ),
      ),
      
    );
  
  }
}