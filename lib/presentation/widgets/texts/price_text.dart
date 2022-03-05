import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceText extends StatelessWidget {
  final Color priceColor;
  final Color textColor;
  final String price;
  final String per;

  const PriceText({
    Key? key,
    required this.priceColor,
    required this.textColor,
    required this.price,
    required this.per
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "\$${price}",
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: priceColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "/per ${per}",
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
