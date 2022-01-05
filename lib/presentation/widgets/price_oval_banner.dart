import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceOvalBanner extends StatelessWidget {
  const PriceOvalBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orange
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "\$50.00",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "/per night",
                style: GoogleFonts.poppins(
                    fontSize: 10
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
