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

// ignore: non_constant_identifier_names

// height //
var spacedh5 = const SizedBox(height: 5);
var spacedh10 = const SizedBox(height: 10);
var spacedh20 = const SizedBox(height: 20);
var spacedh30 = const SizedBox(height: 30);
var spacedh40 = const SizedBox(height: 40);

// width  //
var spacedw10 = const SizedBox(width: 10);
var spacedw20 = const SizedBox(width: 20);
var spacedw30 = const SizedBox(width: 30);
var spacedw40 = const SizedBox(width: 40);
const kPrimaryColor = Color(0xff6849ef);
const kPrimaryLight = Color(0xff8a72f1);
///  size  ///
const kBottomNavigationBarItemSize = 24.0;
const kCategoryCardImageSize = 120.0;
/// icons  /// 
 const _path = 'assets/icons';
const icFeatured = '$_path/star.png';
const icFeaturedOutlined = '$_path/star_outlined.png';
const icLearning = '$_path/play.png';
const icLearningOutlined = '$_path/play_outlined.png';
const icWishlist = '$_path/heart.png';
const icWishlistOutlined = '$_path/heart_outlined.png';
const icSetting = '$_path/settings.png';
const icSettingOutlined = '$_path/settings_outlined.png';
const icDone = '$_path/done.png';
const icLock = '$_path/lock.png';
const icPlayNext = '$_path/play_next.png';
const icPause = '$_path/pause.png';