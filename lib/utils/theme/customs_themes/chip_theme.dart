import 'package:flutter/material.dart';

import '../../../common/color.dart';

class JChipTheme{

// static final lightChipTheme = ChipThemeData(
//   disabledColor: Colors.grey.withOpacity(0.4),
//   labelStyle: const TextStyle(color: JColor.blackColor),
//   selectedColor: JColor.primaryColor,
//   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
//   checkmarkColor: JColor.whiteColor
// );

static final darkChipTheme = ChipThemeData(
  disabledColor: Colors.grey.withOpacity(0.4),
  labelStyle: const TextStyle(color: JColor.whiteColor),
  selectedColor: JColor.primayColor,
  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
  checkmarkColor: JColor.whiteColor
);
}