import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:hexcolor/hexcolor.dart";

// .. Light
Color lightGreyColor = HexColor("F5F1EE");
Color lightBlueColor = HexColor("53C1F9");

// .. Dark
Color darkGreyColor = Colors.grey;
Color darkBlueColor = Colors.blue.shade900;

// .. Normal
Color blueColor = HexColor("407BFF");
Color whiteColor = Colors.white;
Color blackColor = Colors.black;

TextStyle blackTextStyle = GoogleFonts.outfit(
  color: Colors.black,
);

TextStyle whiteTextStyle = GoogleFonts.outfit(
  color: Colors.white,
);

TextStyle lightGreyTextStyle = GoogleFonts.outfit(
  color: lightGreyColor,
);

TextStyle darkGreyTextStyle = GoogleFonts.outfit(
  color: darkGreyColor,
);

TextStyle lightBlueTextStyle = GoogleFonts.outfit(
  color: lightBlueColor,
);

TextStyle blueTextStyle = GoogleFonts.outfit(
  color: Colors.blue[800],
);

// .. FONTWEIGHT
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
