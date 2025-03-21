import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// class TextStore {
//   static TextTheme textTheme = TextTheme(
//     // headlineLarge:  GoogleFonts.poppins(fontSize: 22.sp),
//     // headlinemedium: GoogleFonts.poppins(fontSize: 14.sp), // headlin4
//     // headlineSmall: GoogleFonts.poppins(fontSize: 12.sp), //,healine5
//     // titleLarge: GoogleFonts.poppins(fontSize: 10.sp),
//     // // titleMedium: GoogleFonts.poppins(fontSize: 16.sp),
//     // // titleSmall:GoogleFonts.poppins(fontSize: 14.sp) ,
//     // bodyLarge: GoogleFonts.poppins(fontSize: 8.sp),
//     // // bodyMedium:GoogleFonts.poppins(fontSize: 6.sp),
//     // //  bodySmall:GoogleFonts.poppins(fontSize: 4.sp) ,
//     //  displaySmall:GoogleFonts.poppins(fontSize: 16.sp) ,
//     //  displayMedium: GoogleFonts.poppins(fontSize: 18.sp) ,
//     //  displayLarge: GoogleFonts.poppins(fontSize: 22.sp) ,
//
//     headline1: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 22.sp:44),
//     headline2: GoogleFonts.poppins(fontSize:  getDeviceType()=='phone'? 18.sp:28),
//     headline3: GoogleFonts.poppins(fontSize:  getDeviceType()=='phone'? 16.sp:25),
//     headline4: GoogleFonts.poppins(fontSize:  getDeviceType()=='phone'? 14.sp:20,  color: Theme.of(Get.context!).textTheme.headline4!.color,),
//     headline5: GoogleFonts.poppins(fontSize:  getDeviceType()=='phone'? 12.sp:17),
//     headline6: GoogleFonts.poppins(fontSize:   getDeviceType()=='phone'? 10.sp:14),
//     subtitle1: GoogleFonts.poppins(fontSize:   getDeviceType()=='phone'? 4.sp:18),
//     subtitle2: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 2.sp:17),
//     bodyText1: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 8.sp:12),
//     bodyText2: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 6.sp:18),
//     caption: GoogleFonts.poppins(fontSize:getDeviceType()=='phone'? 5.sp:15),
//     button: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 9.sp:12),
//     overline: GoogleFonts.poppins(fontSize: getDeviceType()=='phone'? 7.sp:10),
//
//   );
//   static String  getDeviceType() {
//     final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//     return data.size.shortestSide < 600 ? 'phone' :'tablet';
//   }
//
//   static TextTheme boldTheme = TextTheme(
//     headline1:
//     GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 25.sp),
//     headline2:
//     GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 20.sp),
//
//     headline6: GoogleFonts.poppins(fontSize:   getDeviceType()=='phone'? 10.sp:20),
//   );
//
//   static TextTheme textTheme1 = TextTheme(
//     headline5: GoogleFonts.poppins(fontSize:  getDeviceType()=='phone'? 12.sp:23),
//
//     headline6: GoogleFonts.poppins(fontSize:   getDeviceType()=='phone'? 10.sp:20),
//   );
//
// }

class TextStore {
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 22.sp : 44),       // headline1
    displayMedium: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 18.sp : 28),      // headline2
    displaySmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 16.sp : 25),       // headline3
    headlineLarge: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 14.sp : 20),      // headline4
    headlineMedium: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 12.sp : 17),     // headline5
    headlineSmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 10.sp : 14),      // headline6
    titleLarge: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 4.sp : 18),          // subtitle1
    titleMedium: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 2.sp : 17),         // subtitle2
    bodyLarge: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 8.sp : 12),           // bodyText1
    bodyMedium: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 6.sp : 18),          // bodyText2
    bodySmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 5.sp : 15),           // caption
    labelLarge: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 9.sp : 12),          // button
    labelSmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 7.sp : 10),          // overline
  );

  static TextTheme boldTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 25.sp),             // headline1
    displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 20.sp),            // headline2
    headlineSmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 10.sp : 20),       // headline6
  );

  static TextTheme textTheme1 = TextTheme(
    headlineMedium: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 12.sp : 23),       // headline5
    headlineSmall: GoogleFonts.poppins(fontSize: getDeviceType() == 'phone' ? 10.sp : 20),       // headline6
  );

  static String getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }
}


class TextWithFont {
  Text textWithPoppinsFont(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      Color? color,
      TextAlign? textAlign}) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      textAlign: textAlign,
    );
  }

  Text textWithRalewayFont(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      required Color color,
      TextAlign? textAlign}) {
    return Text(
      text,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      textAlign: textAlign,
    );
  }

  Text textWithNunitoSansFont(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      Color? color,
      TextAlign? textAlign}) {
    return Text(
      text,
      style: GoogleFonts.nunitoSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
