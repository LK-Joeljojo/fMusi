import 'package:flutter/material.dart';

import '../common/color.dart';
import '../common/image_asset.dart';

class AlbumsRow extends StatelessWidget {
    final Map objet;
    final bool isPlayed;
    final VoidCallback? onTap;

  const AlbumsRow({super.key, required this.objet, this.onTap, this.isPlayed = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
        Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [               
                InkWell(
                  onTap: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(objet["name"],
                            overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium?.apply(
                                    color: JColor.whiteColor,
                                    fontSizeDelta: 3)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(objet["artist"],
                              style: Theme.of(context).textTheme.labelMedium?.apply(
                                  color: JColor.whiteColor.withOpacity(0.5),
                                  fontWeightDelta: 1)),
                        ],
                      ),
                      Text(objet["duration"],
                              style: Theme.of(context).textTheme.labelMedium?.apply(
                                  color: JColor.whiteColor,
                                  fontWeightDelta: 2)),
                      isPlayed ? SizedBox(
                        width: 60,
                        child: Image.asset(
                          MusicImages.vibration,
                          width: 25,
                          height: 25,
                        ),
                      ) : SizedBox(
                        width: 40,
                        child: Image.asset(
                          MusicImages.play,
                          width: 25,
                          height: 25,
                        ),
                      ) 
                    ],
                  ),
                ),
                const Divider(
                        height: 20,
                        thickness: 0.1,
                        color: JColor.dividerColor,
                      )
              ],
            ),
      ],
    );
  }
}