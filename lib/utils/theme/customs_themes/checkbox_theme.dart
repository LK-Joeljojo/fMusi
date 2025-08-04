import 'package:flutter/material.dart';

import '../../../common/color.dart';

class JCheckBoxTheme{

//  static final lightCheckBoxTheme = CheckboxThemeData(
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//   checkColor: WidgetStateProperty.resolveWith<Color>((states) {
//     if (states.contains(WidgetState.selected)) {
//       return JColor.whiteColor;
//     } else {
//       return JColor.blackColor;
//     }
//   }),
//   fillColor: WidgetStateProperty.resolveWith<Color>((states) {
//     if (states.contains(WidgetState.selected)) {
//       return JColor.primaryColor;
//     } else {
//       return Colors.transparent;
//     }
//   }),
// );

 static final darkCheckBoxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  checkColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.selected)) {
      return JColor.whiteColor;
    } else {
      return JColor.blackColor;
    }
  }),
  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.selected)) {
      return JColor.primayColor;
    } else {
      return Colors.transparent;
    }
  }),
 );
}