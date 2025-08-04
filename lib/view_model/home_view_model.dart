import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final hostRecommanded = [
    {
      "image": "assets/images/juiceWrld2.jpeg",
      "name": "Party Never Ends ",
      "artist": "juice Wrld",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "legends Never Die",
      "artist": "juice Wrld",
    },
  ].obs;
   final playList = [
    {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Illuminate",
      "artist": "shawn Mendes",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "legends Never Die",
      "artist": "juice Wrld",
    },
    {
      "image": "assets/images/juiceWrld.jpeg",
      "name": "Goodbye and GoodRidance",
      "artist": "juice Wrld",
    },
     {
      "image": "assets/images/tiako.jpg",
      "name": "M3lo",
      "artist": "tiakola",
    },
  ].obs;
   final recentlyPlayed = [
    {
      "image": "assets/images/juiceWrld.jpeg",
      "name": "Empty of pockets ",
      "artist": "juice Wrld",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Stay high",
      "artist": "juice Wrld",
    },
     {
      "image": "assets/images/tiako.jpg",
      "name": "M3lo",
      "artist": "tiakola",
    },
     {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Treat you better",
      "artist": "shawn Mendes",
    },
  ].obs;
}
