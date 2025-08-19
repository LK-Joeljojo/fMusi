import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fmusic/view_model/albums_view_model.dart';
import 'package:fmusic/widgets/albums_row.dart';
import 'package:get/get.dart';
import '../../common/color.dart';
import '../../common/image_asset.dart';
import '../../widgets/button_icon_text.dart';

class AlbumDetailView extends StatelessWidget {
  AlbumDetailView({super.key});
  final alBVM = Get.put(AlbumsViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text("Albums Details",
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              HomeViewImages.search,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Image.asset(
                        MusicImages.juiceWrld,
                        width: double.maxFinite,
                        height: media.height * 0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: JColor.blackColor.withOpacity(0.2),
                    height: media.height * 0.25,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  MusicImages.juiceWrld,
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Legends Never Die",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "by Juice Wrld",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.apply(
                                              color: JColor.whiteColor
                                                  .withOpacity(0.9)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "2022",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.apply(
                                                  color: JColor.whiteColor
                                                      .withOpacity(0.8)),
                                        ),
                                        Text(
                                          " • ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.apply(color: JColor.whiteColor),
                                        ),
                                        Text(
                                          "17 songs",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.apply(
                                                  color: JColor.whiteColor
                                                      .withOpacity(0.8)),
                                        ),
                                        Text(
                                          " • ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.apply(color: JColor.whiteColor),
                                        ),
                                        Text(
                                          "2 hours",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.apply(
                                                  color: JColor.whiteColor
                                                      .withOpacity(0.8)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonIconText(
                                hasborder: false,
                                imageUrl: MusicImages.musicPlay,
                                text: "Play",
                              ),
                              ButtonIconText(
                                imageUrl: MusicImages.share,
                                text: "share",
                              ),
                              ButtonIconText(
                                imageUrl: HomeViewImages.heartOutline,
                                text: "Add to favorites",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: alBVM.playedSongs.length,
                  itemBuilder: (context, index) {
                    final obj = alBVM.playedSongs[index];
                    return AlbumsRow(
                      objet: obj,
                      isPlayed: index == 0,
                      onTap: () {},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
