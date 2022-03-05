import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelTitleText extends StatelessWidget {
  final Color textColor;
  final String text;

  const HotelTitleText({
    Key? key,
    required this.textColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
