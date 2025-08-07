import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final txtSearch = TextEditingController().obs;
  static final hotRecommanded = [
    {
      "image": "assets/images/juiceWrld2.jpeg",
      "name": "Party Never Ends ",
      "artist": "Juice Wrld",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Legends Never Die",
      "artist": "Juice Wrld",
    },
  ].obs;
  static  final playList = [
    {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Illuminate",
      "artist": "Shawn Mendes",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Legends Never Die",
      "artist": "Juice Wrld",
    },
    {
      "image": "assets/images/juiceWrld.jpeg",
      "name": "Goodbye and GoodRidance",
      "artist": "Juice Wrld",
    },
     {
      "image": "assets/images/tiako.jpg",
      "name": "M3lo",
      "artist": "Tiakola",
    },
  ].obs;
  static final recentlyPlayed = [
    {
      "image": "assets/images/juiceWrld2.jpeg",
      "name": "Empty of pockets ",
      "artist": "Juice Wrld",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Stay high",
      "artist": "Juice Wrld",
    },
     {
      "image": "assets/images/tiako.jpg",
      "name": "M3lo",
      "artist": "Tiakola",
    },
     {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Treat you better",
      "artist": "Shawn Mendes",
    },
  ].obs;
}
