import 'package:get/get.dart';

class PlaylistsViewModel extends GetxController{

    final playListArr = [
    {
      "image": "assets/images/seanPaul.jpeg",
      "name": "My top 10",
      "songs": "115 songs",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Best Artists",
      "songs": "115 songs",
    },
     {
      "image": "assets/images/dadju1.jpeg",
      "name": "Classics",
      "songs": "115 songs",
    }, {
      "image": "assets/images/aimés.webp",
      "name": "Favorites",
      "songs": "115 songs",
    }, 
  ].obs;
   final myPlayList = [
    {
      "image": "assets/images/shawnMendes.jpg",
      "name": "Mix 2017",
    },
     {
      "image": "assets/images/legendsND.jpg",
      "name": "Juice Wrld",
    },
    {
      "image": "assets/images/juiceWrld.jpeg",
      "name": "Mélancolisme",
    },
     {
      "image": "assets/images/tiako.jpg",
      "name": "Ma playlist n°1",
    },
  ].obs;
}