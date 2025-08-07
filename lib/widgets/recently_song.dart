import 'package:flutter/material.dart';
import 'package:fmusic/common/image_asset.dart';
import '../common/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecentlySong extends StatelessWidget {
  final Map objet;

  const RecentlySong({super.key, required this.objet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          
        },
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
              child: Row(
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
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        HomeViewImages.heartOutline,
                        width: 20,
                        height: 20,
                      ),
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        itemSize: 10,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        unratedColor: JColor.primayColor.withOpacity(0.2),
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: JColor.primayColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
