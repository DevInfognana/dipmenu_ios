import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../extra/common_widgets/text_scalar_factor.dart';

// Color mainColor = const Color(0xffFF8A00);
Color mainColor = Colors.red;
const Color onBoardingDocsColor = Color.fromRGBO(144, 152, 177, 1);
const Color onBoardingIndcatorColor = Color.fromRGBO(229, 229, 229, 1);
const Color authTextFromFieldFillColor = Color.fromRGBO(241, 244, 254, 1);
const Color authTextFromFieldPorderColor = Color.fromRGBO(214, 218, 225, 1);
const Color authTextFromFieldHintTextColor = Color.fromRGBO(194, 189, 189, 1);
const Color authTextFromFieldErrorBorderColor = Color.fromRGBO(255, 0, 0, 1);
const Color headline1Color = Color.fromRGBO(0, 76, 255, 1);
const Color borderColor = Colors.black;
const Color hintColor = Color(0xffC1C6C6);

const Color descriptionColor = Color(0xff878D8D);
const Color titleColor = Color(0xff323637);
const Color tileColor = Color(0xffCFCFCF);
const Color drivethru = Color(0xffA3BA15);
const Color pickuporder = Color(0xffFFCD00);
const Color scheduledpickuporder = Color(0xffFF7A00);
const darkSeafoamGreen1 = Color(0xff45b080);

class ThemesApp {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: mainColor,
    secondaryHeaderColor: Colors.grey.shade100,
    cardColor: const Color(0xffFFFFFF),
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
          fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 22.sp : 44),
      headline2:  GoogleFonts.poppins(fontSize:  DeviceTypeValues.getDeviceType()=='phone'? 18.sp:28, color: Colors.black),

      headline3: GoogleFonts.poppins(
          fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 16.sp : 25,
          color: Colors.black),
      headline4: GoogleFonts.poppins(
          fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 14.sp : 20,
          color: Colors.black),
      headline5: GoogleFonts.poppins(
          fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 12.sp : 17,
          color: Colors.black),
      headline6: GoogleFonts.poppins(
          fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 10.sp : 14,color: Colors.black),
      bodyText1: GoogleFonts.poppins(fontSize: DeviceTypeValues.getDeviceType()=='phone'? 8.sp:12, color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black45),
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(mainColor))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: mainColor, size: 3.h),
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 3.h)),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  // static final dark = ThemeData.dark().copyWith(
  //   scaffoldBackgroundColor: Color(0xFF18172B),
  //   primaryColor: darkGreyClr,
  //   secondaryHeaderColor:Color(0xFF27273c),
  //
  //   textTheme: TextTheme(
  //     headline1: TextStyle(
  //       color: Colors.white,
  //     ),
  //     headline2: TextStyle(
  //       color: Color(0xFF18172B).withOpacity(.8),
  //     ),
  //     headline3: TextStyle(
  //       color: Colors.black,
  //     ),
  //     headline4: TextStyle(
  //       color: Color(0xFF27273c),
  //     ),
  //     headline5: TextStyle(
  //       color: Color.fromRGBO(144, 152, 177, 1),
  //     ),
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     toolbarTextStyle: TextStyle(color: Colors.white),
  //     centerTitle: true,
  //     iconTheme: IconThemeData(color: Colors.white),
  //   ),
  //
  //   cardColor: Color(0xFF27273c),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all<Color>(mainColor))),
  //   bottomNavigationBarTheme:
  //   BottomNavigationBarThemeData(backgroundColor: Color(0xFF1F1F30)),
  //   iconTheme: IconThemeData(color: Colors.white),
  //
  //   hintColor: Colors.white,
  // );

  static final dark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF18172B),
      primaryColor: Colors.deepPurple,
      secondaryHeaderColor: const Color(0xFF27273c),
      hoverColor: Colors.red,
      //This is how to use find another way for him to incorporate this
      // textTheme: TextTheme(
      //     headlineMedium: TextStore.textTheme.headlineMedium!,
      //     headlineSmall: TextStore.textTheme.headlineSmall!,
      //     bodyLarge: TextStore.textTheme.bodyLarge!,
      //     bodyMedium: TextStore.textTheme.bodyMedium,
      //     titleMedium: TextStore.textTheme.titleMedium!,
      //     titleSmall: TextStore.textTheme.titleSmall!,
      //     labelLarge: TextStore.textTheme.labelLarge!,
      //     bodySmall: TextStore.textTheme.bodySmall!,
      //     labelSmall: TextStore.textTheme.labelSmall!),
      textTheme: TextTheme(
        headline1: const TextStyle(color: Colors.black),
        headline2:  GoogleFonts.poppins(fontSize:  DeviceTypeValues.getDeviceType()=='phone'? 18.sp:28, color: Colors.white),
        headline3: GoogleFonts.poppins(
            fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 16.sp : 25,
            color: Colors.white),
        headline4: GoogleFonts.poppins(
            fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 14.sp : 20,
            color: Colors.white),
        headline5: GoogleFonts.poppins(
            fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 12.sp : 17,
            color: Colors.white),
        headline6: GoogleFonts.poppins(
            fontSize: DeviceTypeValues.getDeviceType() == 'phone' ? 10.sp : 14,color: Colors.white),
        bodyText1: GoogleFonts.poppins(fontSize: DeviceTypeValues.getDeviceType()=='phone'? 8.sp:12, color: Colors.white),


      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarTextStyle: TextStyle(color: Colors.white),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      cardColor: const Color(0xFF27273c),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
          backgroundColor: const Color(0xFF18172B),
          selectedIconTheme: IconThemeData(color: mainColor, size: 3.h),
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 3.h)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(mainColor))),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     backgroundColor: const Color(0xFF18172B),
      //     selectedIconTheme: IconThemeData(color: mainColor, size: 3.h),
      //     selectedItemColor: mainColor,
      //     unselectedItemColor: Colors.white,
      //     unselectedIconTheme: IconThemeData(color: Colors.white, size: 3.h)),
      iconTheme: const IconThemeData(color: Colors.white),
      hintColor: Colors.white);
}
