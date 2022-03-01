import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceText extends StatelessWidget {
  final Color priceColor;
  final Color textColor;

  const PriceText({
    Key? key,
    required this.priceColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\$50.00",
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: priceColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "/per night",
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
