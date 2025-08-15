import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';

class PlaylistType extends StatelessWidget {
  final Map objet;
  const PlaylistType({super.key, required this.objet});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Image.asset(
          objet["image"],
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          color: JColor.blackColor.withOpacity(0.5),
          width: double.maxFinite,
          height: double.maxFinite,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(objet["name"],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelLarge?.apply(
                                color: JColor.whiteColor,
                              )),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Text(objet["songs"],
                        style: Theme.of(context).textTheme.labelMedium?.apply(
                              color: JColor.whiteColor.withOpacity(0.5),
                            )),
                  ],
                )),
                Image.asset(
                  MusicImages.play,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                  color: JColor.whiteColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
