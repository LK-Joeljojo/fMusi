import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/color.dart';
import '../common/image_asset.dart';

class AllsongRow extends StatelessWidget {
  final bool isWeb;
  final Map objet;
  final VoidCallback? onTap;
  final VoidCallback? onTapPlay;

  const AllsongRow(
      {super.key, required this.objet, this.onTap, this.isWeb = false, this.onTapPlay});

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
                  child: isWeb
                      ? CachedNetworkImage(
                          imageUrl: objet["image"].toString(),
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
                      : Image.asset(
                          objet["image"],
                          width: 50,
                          height: 50,
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
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              child: Text(objet["name"],
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
                            Text(objet["artists"],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.apply(
                                        color:
                                            JColor.whiteColor.withOpacity(0.7),
                                        fontWeightDelta: 2)),
                          ],
                        ),
                        InkWell(
                          onTap: onTapPlay,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            //color: Colors.amber,
                            child: Image.asset(
                              MusicImages.play,
                              width: 25,
                              height: 25,
                            ),
                          ),
                        )
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
