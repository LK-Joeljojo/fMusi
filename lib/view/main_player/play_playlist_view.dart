import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common/color.dart';
import '../../common/image_asset.dart';
import '../../view_model/allsong_view_model.dart';
import '../../widgets/allsong_row.dart';

class PlayPlaylistView extends StatelessWidget {
  PlayPlaylistView({super.key});
  final allSC = Get.put(AllsongViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: JColor.bgColor,
          automaticallyImplyLeading: true,
          elevation: 0,
          title: Text("Playist", style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                HomeViewImages.search,
                width: 25,
                height: 25,
                color: JColor.whiteColor,
                fit: BoxFit.contain,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 45,
                  splashRadius: 25,
                  icon: Image.asset(
                    MusicImages.forwardLeft,
                    width: 45,
                    height: 45,
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: media.width * 0.4,
                      height: media.width * 0.4,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          MusicImages.juiceWrld,
                        ),
                      ),
                    ),
                    Container(
                      width: media.width * 0.4,
                      height: media.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(media.width * 0.4,),
                        border: Border.all(
                          width: 0.5,
                          color: JColor.whiteColor
                        )
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.4,
                      width: media.width * 0.4,
                      child: SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                            trackWidth: 4,
                            progressBarWidth: 5,
                            shadowWidth: 7,
                          ),
                          customColors: CustomSliderColors(
                            dotColor: Colors.transparent,
                            trackColor: Colors.transparent,
                            progressBarColors: [
                              JColor.primayColor,
                              JColor.primayColor
                            ],
                            // shadowColor: JColor.blackColor,
                            // shadowMaxOpacity: 0.05,
                          ),
                          infoProperties: InfoProperties(
                            topLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            topLabelText: 'Elapsed',
                            bottomLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            bottomLabelText: 'time',
                            mainLabelStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w600,
                            ),
                            // modifier: (double value) {
                            //   final time =
                            //       printDuration(Duration(seconds: value.toInt()));
                            //   return time;
                            // },
                          ),
                          startAngle: 270,
                          angleRange: 360,
                          size: 350.0,
                        ),
                        min: 0,
                        max: 100,
                        initialValue: 42,
                        onChange: (double value) {
                          // callback providing a value while its being changed (with a pan gesture)
                        },
                        onChangeStart: (double startValue) {
                          // callback providing a starting value (when a pan gesture starts)
                        },
                        onChangeEnd: (double endValue) {
                          // ucallback providing an ending value (when a pan gesture ends)
                        },
                        // innerWidget: (double value) {
                        //   // use your custom widget inside the slider (gets a slider value from the callback)
                        // },
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 45,
                  splashRadius: 25,
                  icon: Image.asset(
                    MusicImages.forwardRight,
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "2:30 | 4:04",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Conversations",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Juice Wrld • Album • Legends never Die",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 25,
            ),
            Obx(() {
              return ListView.builder(
                  itemCount: allSC.allSongs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final obj = allSC.allSongs[index];
                    return Column(
                      children: [
                        AllsongRow(
                          objet: obj,
                          onTap: () {
                            
                          },
                        ),
                      ],
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
