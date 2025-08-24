import 'package:flutter/material.dart';

import '../common/color.dart';

class PlaylistSong extends StatelessWidget {
  final Map objet;
  final bool hasArtists;
  final bool hasYears;
  const PlaylistSong({super.key, required this.objet,  this.hasArtists = true, this.hasYears = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      //width: 220,
      //height: 160,
      //color: JColor.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              objet["image"],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 100,
            child: Text(objet["name"],
            overflow: TextOverflow.ellipsis,
            // maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.apply(fontSizeDelta: 2,color: JColor.whiteColor.withOpacity(0.9),)),
          ),
          const SizedBox(
            height: 5,
          ),
          if(hasArtists)
          Text(objet["artist"],
              style: Theme.of(context).textTheme.labelMedium?.apply(
                  color: JColor.whiteColor.withOpacity(0.7),
                  )),
           if(hasYears)
           Text(objet["years"],
              style: Theme.of(context).textTheme.labelMedium?.apply(
                  color: JColor.whiteColor.withOpacity(0.7),
                  )),
        ],
      ),
    );
  }
}
