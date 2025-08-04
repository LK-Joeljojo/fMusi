import 'package:flutter/material.dart';

import '../../../common/color.dart';

class JOutlinedButonTheme {
JOutlinedButonTheme._();

// lightTheme
// static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
//   style: OutlinedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: JColor.blackColor,
//     side: const BorderSide(color: JColor.blackColor),
//     padding: const EdgeInsets.symmetric(vertical: 10),
//     textStyle:  const TextStyle(fontSize: 16,color: JColor.blackColor,fontWeight: FontWeight.w600),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   )
// );

// darkTheme

static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: JColor.whiteColor,
    side: const BorderSide(color: JColor.whiteColor),
    padding: const EdgeInsets.symmetric(vertical: 10),
    textStyle:  const TextStyle(fontSize: 16,color: JColor.whiteColor,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  )
);
}