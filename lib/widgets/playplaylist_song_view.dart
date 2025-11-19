import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/color.dart';

class PlayplaylistSongView extends StatelessWidget {
  final MediaItem objet;
  final Widget rigth;
  final VoidCallback? onTap;

  const PlayplaylistSongView(
      {super.key, required this.objet, this.onTap, required this.rigth, });

  @override
  Widget build(BuildContext context) {
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
                  child:  CachedNetworkImage(
                          imageUrl: objet.artUri.toString(),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              "assets/images/close.png",
                              fit: BoxFit.cover,
                            );
                          },
                          placeholder: (context, url) {
                            return Image.asset(
                              "assets/images/close.png",
                              fit: BoxFit.cover,
                            );
                          },
                          width: 50,
                          height: 50,
                        )
                     ),
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
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(objet.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.apply(
                                          color: JColor.whiteColor
                                              .withOpacity(0.9),
                                          fontSizeDelta: 2)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(objet.artist ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.apply(
                                        color:
                                            JColor.whiteColor.withOpacity(0.7),
                                        fontWeightDelta: 2)),
                          ],
                        ),
                       rigth
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 0.1,
                      color: JColor.dividerColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
