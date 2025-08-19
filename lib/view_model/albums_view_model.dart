import 'package:get/get.dart';

class AlbumsViewModel extends GetxController {
  final albumsType = [
    {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Illuminate",
      "songs": "15 songs",
      "artist": "Shawn Mendes",
    },
    {
      "image": "assets/images/legendsND.jpg",
      "name": "Legends Never Die",
      "songs": "17 songs",
      "artist": "Juice Wrld",
    },
    {
      "image": "assets/images/juiceWrld.jpeg",
      "name": "Goodbye and GoodRidance",
      "songs": "20 songs",
      "artist": "Juice Wrld",
    },
    {
      "image": "assets/images/tiako.jpg",
      "name": "M3lo",
      "songs": "08 songs",
      "artist": "Tiakola",
    },
    {
      "image": "assets/images/postMalone.jpeg",
      "name": "Circles",
      "songs": "28 songs",
      "artist": "Post Malone",
    },
    {
      "image": "assets/images/seanPaul.jpeg",
      "name": "She doesn't Mind",
      "songs": "11 songs",
      "artist": "Sean Paul",
    },
  ].obs;
   final playedSongs = [
    {
      "duration": "3:16",
      "name": "Conversations",
      "artist": "Juice Wrld",
    },
     {
      "duration": "2:16",
      "name": "Stay high",
      "artist": "Juice Wrld",
    },
     {
      "duration": "3:16",
      "name": "Man of the Year",
      "artist": "Juice Wrld",
    },
     {
      "duration": "4:16",
      "name": "Righteous",
      "artist": "Juice Wrld",
    },
    {
      "duration": "3:30",
      "name": "Blood On My Jeans",
      "artist": "Juice Wrld",
    },
     {
      "duration": "2:55",
      "name": "Titanic",
      "artist": "Juice Wrld",
    },
  ].obs;
}
