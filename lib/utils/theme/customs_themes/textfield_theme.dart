import 'package:flutter/material.dart';

import '../../../common/color.dart';

class JTextfieldTheme {
  // static final lightInputDecorationTheme = InputDecorationTheme(
  //     errorMaxLines: 3,

  //     labelStyle:
  //         const TextStyle().copyWith(fontSize: 14, color: JColor.blackColor),
  //     hintStyle:
  //         const TextStyle().copyWith(fontSize: 14, color: JColor.blackColor),
  //     errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
  //     floatingLabelStyle:
  //         const TextStyle().copyWith(color: JColor.blackColor.withOpacity(0.8)),
  //     border: const OutlineInputBorder().copyWith(
  //       borderRadius: BorderRadius.circular(14),
  //       borderSide: const BorderSide(
  //         width: 1,
  //       )
  //     ),
  //     enabledBorder: const OutlineInputBorder().copyWith(
  //       borderRadius: BorderRadius.circular(14),
  //       borderSide: const BorderSide(
  //         width: 1,
  //       )
  //     ),
  //     focusedBorder: const OutlineInputBorder().copyWith(
  //       borderRadius: BorderRadius.circular(14),
  //       borderSide: BorderSide(
  //         width: 1,
  //         color: JColor.blackColor.withOpacity(0.12)
  //       )
  //     ),
  //     focusedErrorBorder: const OutlineInputBorder().copyWith(
  //       borderRadius: BorderRadius.circular(14),
  //       borderSide: const BorderSide(
  //         width: 1,
  //       )
  //     ),
  //    errorBorder: const OutlineInputBorder().copyWith(
  //       borderRadius: BorderRadius.circular(14),
  //       borderSide: const BorderSide(
  //         width: 1,
  //       )
  //     ),
  //     );




      static final darkInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      labelStyle:
          const TextStyle().copyWith(fontSize: 14, color: JColor.whiteColor),
      hintStyle:
          const TextStyle().copyWith(fontSize: 14, color: JColor.whiteColor),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle:
          const TextStyle().copyWith(color: JColor.whiteColor),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
        )
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
        )
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
          color: JColor.whiteColor
        )
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
        )
      ),
     errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          width: 1,
        )
      ),
      );
      

}
