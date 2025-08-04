import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              HomeViewImages.more,
              width: 25,
              height: 25,
            )),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: JColor.blackColor.withOpacity(0.50),
          ),
          child: TextField(
            style: TextStyle(color: JColor.whiteColor.withOpacity(0.70), fontSize: 12) ,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Search album song",
              hintStyle:
                   TextStyle(color: JColor.whiteColor.withOpacity(0.70), fontSize: 12),
              prefixIcon: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                   width: 30,
                  // height: 20,
                  //color: JColor.primayColor,
                  child: Image.asset(
                    HomeViewImages.search,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Hot Recommanded",),)
          ],
        ),
      ),
    );
  }
}
