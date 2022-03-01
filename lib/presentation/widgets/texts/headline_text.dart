import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Near You',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'View All',
            style: GoogleFonts.poppins(
              fontSize: 13,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
