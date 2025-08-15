import 'package:flutter/material.dart';

import '../common/color.dart';
import '../common/image_asset.dart';

class AllsongRow extends StatelessWidget {
    final Map objet;
    final VoidCallback? onTap;

  const AllsongRow({super.key, required this.objet, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15,),
        InkWell(
          onTap: onTap,
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
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
                                Text(objet["name"],
                                    style: Theme.of(context).textTheme.labelMedium?.apply(
                                        color: JColor.whiteColor.withOpacity(0.9),
                                        fontSizeDelta: 2)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(objet["artist"],
                                    style: Theme.of(context).textTheme.labelMedium?.apply(
                                        color: JColor.whiteColor.withOpacity(0.7),
                                        fontWeightDelta: 2)),
                              ],
                            ),
                            Image.asset(
                              MusicImages.play,
                              width: 25,
                              height: 25,
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