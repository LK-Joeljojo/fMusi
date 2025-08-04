import 'package:flutter/material.dart';

import '../../../common/color.dart';

class JBottomSheetTheme{

  // static final lightBottomSheetTheme =  BottomSheetThemeData(
  //   showDragHandle: true,
  //   backgroundColor: JColor.whiteColor,
  //   modalBackgroundColor: JColor.whiteColor,
  //   constraints: const BoxConstraints(minWidth: double.infinity),
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  // );


static final darkBottomSheetTheme =  BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: JColor.blackColor,
    modalBackgroundColor: JColor.blackColor,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}