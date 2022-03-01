import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelTitleText extends StatelessWidget {
  final Color textColor;
  const HotelTitleText({
    Key? key,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rooms Hotel',
      style: GoogleFonts.poppins(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
