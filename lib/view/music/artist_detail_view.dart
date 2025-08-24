import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fmusic/view_model/albums_view_model.dart';
import 'package:fmusic/widgets/playlist_song.dart';
import 'package:fmusic/widgets/title_section.dart';
import 'package:get/get.dart';

import '../../common/color.dart';
import '../../common/image_asset.dart';
import '../../widgets/albums_row.dart';

class ArtistDetailView extends StatelessWidget {
  ArtistDetailView({super.key});
  final aVM = Get.put(AlbumsViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text("Artist Details",
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Image.asset(
                        MusicImages.jwArtist,
                        width: double.maxFinite,
                        height: media.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: JColor.blackColor.withOpacity(0.3),
                    height: media.height * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Juice Wrld",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Rap,Rock,SoundClound",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.apply(
                                        color:
                                            JColor.whiteColor.withOpacity(0.5)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "17M",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    "Followers",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.apply(
                                            color: JColor.whiteColor
                                                .withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "4.16B",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    "Listners",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.apply(
                                            color: JColor.whiteColor
                                                .withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    "Follows",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.apply(color: JColor.whiteColor),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TitleSection(
              title: "Top Albums",
              hasViewAll: true,
              trailing: "View All",
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 160,
              //color: JColor.primayColor,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: aVM.topAlbums.length,
                  itemBuilder: (context, index) {
                    final obj = aVM.topAlbums[index];
                    return PlaylistSong(
                      objet: obj,
                      hasYears: true,
                      hasArtists: false,
                    );
                  }),
            ),         
            const TitleSection(
              title: "Top Songs",
              hasViewAll: true,
              trailing: "View All",
            ),
            ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: aVM.playedSongs.length,
                  itemBuilder: (context, index) {
                    final obj = aVM.playedSongs[index];
                    return AlbumsRow(
                      objet: obj,
                      // isPlayed: index == 0,
                      onTap: () {},
                    );
                  }),
          ],
        ),
      ),
    );
  }
}
