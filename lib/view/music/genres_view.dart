import 'package:flutter/material.dart';
import 'package:fmusic/widgets/gender_list.dart';
import 'package:get/get.dart';

import '../../view_model/gender_view_model.dart';

class GenresView extends StatelessWidget {
 GenresView({super.key});

final gdVM = Get.put(GenderViewModel()) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            //physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemCount: gdVM.genderList.length,
            itemBuilder: (context, index) {
              final obj = gdVM.genderList[index];
              return GenderList(objet: obj);
            }));
  }
}
