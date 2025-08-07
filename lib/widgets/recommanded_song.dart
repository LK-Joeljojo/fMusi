import 'package:flutter/material.dart';

import '../common/color.dart';

class RecommandedSong extends StatelessWidget {
  final Map objet;
  const RecommandedSong({super.key, required this.objet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      width: 220,
      height: 160,
      //color: JColor.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              objet["image"],
              width: double.maxFinite,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(objet["name"],style: Theme.of(context).textTheme.labelMedium?.apply(color: JColor.whiteColor.withOpacity(0.9),fontSizeDelta: 2)),
          const SizedBox(
            height: 5,
          ),
          Text(objet["artist"],style: Theme.of(context).textTheme.labelMedium?.apply(color: JColor.whiteColor.withOpacity(0.7),fontWeightDelta: 2)),
        ],
      ),
    );
  }
}
