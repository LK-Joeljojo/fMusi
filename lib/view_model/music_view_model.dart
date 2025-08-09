import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? controller;
  RxInt selectTab = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab.value = controller?.index ?? 0;
    });
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
