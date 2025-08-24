import 'package:get/get.dart';

class GenderViewModel extends GetxController{


   final genderList = [
    {
      "image": "assets/images/jazzM.jpg",
      "name": "Jazz",
      "songs": "15 songs",
    },
    {
      "image": "assets/images/instrumentalMusic.jpeg",
      "name": "Instrumental",
      "songs": "17 songs",
    },
    {
      "image": "assets/images/RandB.jpeg",
      "name": "Soul and R&B",
      "songs": "20 songs",
    },
    {
      "image": "assets/images/rockMusic.jpeg",
      "name": "Rock",
      "songs": "08 songs",
    },
    {
      "image": "assets/images/hipHop.jpg",
      "name": "Hip Hop",
      "songs": "28 songs",
    },
    {
      "image": "assets/images/countryMusic.jpeg",
      "name": "Country music",
      "songs": "11 songs",
    },
   ].obs;
}