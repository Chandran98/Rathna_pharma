
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/colors/color_palette.dart';


Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
String fontFamilyBoldGlobal;
String fontFamilyPrimaryGlobal;
String fontFamilySecondaryGlobal;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;

Color appBarBackgroundColorGlobal = Colors.white;
Color appButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
double defaultAppButtonRadius = 8.0;
double defaultAppButtonElevation = 4.0;
bool enableAppButtonScaleAnimationGlobal = true;
int appButtonScaleAnimationDurationGlobal;
ShapeBorder defaultAppButtonShapeBorder;

Color defaultLoaderBgColorGlobal = Colors.white;
Color defaultLoaderAccentColorGlobal;

Color defaultInkWellSplashColor;
Color defaultInkWellHoverColor;
Color defaultInkWellHighlightColor;
double defaultInkWellRadius;

Color shadowColorGlobal = Colors.grey.withOpacity(0.2);
int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

int passwordLengthGlobal = 6;

 SharedPreferences sharedPreferences;

ShapeBorder defaultDialogShape;

// // String defaultCurrencySymbol = currencyRupee;

// // LanguageDataModel? selectedLanguageDataModel;
// // List<LanguageDataModel> localeLanguageList = [];

// // bool forceEnableDebug = false;

// // Toast Config
// Color defaultToastBackgroundColor = Colors.grey.shade200;
// Color defaultToastTextColor = Colors.black;
// ToastGravity defaultToastGravityGlobal = ToastGravity.CENTER;
// BorderRadius defaultToastBorderRadiusGlobal = radius(30);

// PageRouteAnimation? pageRouteAnimationGlobal;
// Duration pageRouteTransitionDurationGlobal = 700.milliseconds;