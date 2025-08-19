import 'package:flutter/material.dart';

import '../../common/color.dart';
import '../../common/image_asset.dart';

class ArtistDetailView extends StatelessWidget {
  const ArtistDetailView({super.key});

  @override
  Widget build(BuildContext context) {
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
      
    );
  }
}