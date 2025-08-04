import 'package:flutter/material.dart';

import '../../common/color.dart';
import 'customs_themes/appbar_theme.dart';
import 'customs_themes/bottom_sheet_theme.dart';
import 'customs_themes/checkbox_theme.dart';
import 'customs_themes/chip_theme.dart';
import 'customs_themes/eleveted_bouton_theme.dart';
import 'customs_themes/outlined_buton_theme.dart';
import 'customs_themes/text_theme.dart';
import 'customs_themes/textfield_theme.dart';


class JAppTheme{
  JAppTheme._();

  // static ThemeData lightTheme = ThemeData(
  //   useMaterial3:true,
  //   scaffoldBackgroundColor: TColor.whiteColor,
  //   brightness: Brightness.light,
  //   primaryColor: TColor.whiteColor,
  //   textTheme: TTextTheme.lightTextTheme,
  //   elevatedButtonTheme: TElevetedBoutonTheme.lightElevatedButtonTheme,
  //   outlinedButtonTheme: TOutlinedButonTheme.lightOutlinedButtonTheme,
  //   appBarTheme: TAppBarTheme.lightAppBarTheme,
  //   checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
  //   bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
  //   chipTheme: TChipTheme.lightChipTheme,
  //   inputDecorationTheme: TTextfieldTheme.lightInputDecorationTheme
    
  // );
  static ThemeData darkTheme = ThemeData(
    useMaterial3:false,
    scaffoldBackgroundColor: JColor.bgColor,
    //brightness: Brightness.dark,
    fontFamily: "Poppins",
    colorScheme: ColorScheme.fromSeed(seedColor: JColor.primayColor),
    textTheme: JTextTheme.darkTextTheme,
    elevatedButtonTheme: JElevetedBoutonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButonTheme.darkOutlinedButtonTheme,
    appBarTheme: JAppBarTheme.darkAppBarTheme,
    checkboxTheme: JCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: JBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: JChipTheme.darkChipTheme,
    inputDecorationTheme: JTextfieldTheme.darkInputDecorationTheme


  );

}