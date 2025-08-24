import 'package:flutter/material.dart';

import '../common/color.dart';
import '../common/image_asset.dart';

class ArtistsList extends StatelessWidget {
  final Map objet;
  final VoidCallback? onTap;
  final Function(int)? onTapMenu;

  const ArtistsList({super.key, required this.objet, this.onTap, this.onTapMenu});

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
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    objet["image"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(objet["artist"],
                                style:
                                    Theme.of(context).textTheme.bodyMedium?.apply(
                                          color: JColor.whiteColor,
                                        )),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${objet["albums"]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.apply(
                                          color:
                                              JColor.whiteColor.withOpacity(0.6),
                                        )),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "•",
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(objet["songs"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.apply(
                                          color:
                                              JColor.whiteColor.withOpacity(0.6),
                                        )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: PopupMenuButton(
                              color: JColor.popupColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              icon: Image.asset(
                                MusicImages.more,
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                              padding: EdgeInsets.zero,
                              onSelected: onTapMenu,
                              offset: const Offset(-15, 15),
                              itemBuilder: (context) {
                                return menuItems.map((item) {
                                  return PopupMenuItem<int>(
                                      value: item["id"],
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 0),
                                      child: Text(item["title"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge));
                                }).toList();
                              }),
                        ),
                      ],
                    ),
          
                    // const Divider(
                    //   height: 20,
                    //   thickness: 0.1,
                    //   color: JColor.dividerColor,
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
