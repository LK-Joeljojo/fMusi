import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/music/album_detail_view.dart';
import 'package:get/get.dart';

class AlbumsSong extends StatelessWidget {
  final Map objet;
  final Function(int)? onTapMenu;
  const AlbumsSong({super.key, required this.objet, this.onTapMenu});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"id": 1, "title": "Play"},
      {"id": 2, "title": "Play reset"},
      {"id": 4, "title": "Add to playlist queue"},
      {"id": 5, "title": "Rename"},
      {"id": 6, "title": "Tag editor"},
      {"id": 7, "title": "Go to Artist"},
      {"id": 8, "title": "Delete from device"},
      {"id": 9, "title": "Share"},
    ];
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to( AlbumDetailView());
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              objet["image"],
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(objet["name"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color: JColor.whiteColor,
                      )),
              // const SizedBox(
              //   height: 5,
              // ),
            ),
            SizedBox(
              height: 15,
              width: 15,
              child: PopupMenuButton(
                  color: JColor.popupColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  icon: Image.asset(
                    MusicImages.more,
                    width: 15,
                    height: 15,
                    fit: BoxFit.cover,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: onTapMenu,
                  offset: const Offset(-10, 15),
                  itemBuilder: (context) {
                    return menuItems.map((item){
                      return  PopupMenuItem<int>(
                          value: item["id"],
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Text(item["title"],
                              style: Theme.of(context).textTheme.labelLarge));


                    }).toList();
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(objet["artist"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.apply(
                        color: JColor.whiteColor.withOpacity(0.5),
                      )),
              // const SizedBox(
              //   height: 5,
              // ),
              //
            ),
            Text("• ",
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: JColor.whiteColor.withOpacity(0.5),
                    )),
            Text(objet["songs"],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: JColor.whiteColor.withOpacity(0.5),
                    )),
          ],
        ),
      ],
    );
    
  }
}
