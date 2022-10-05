import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadlineText extends StatelessWidget {
  final String textLeft;
  final String textRight;

  const HeadlineText({
    Key? key,
    required this.textLeft,
    required this.textRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
            ),
          ),
          Text(
            textRight,
            style: GoogleFonts.poppins(
              fontSize: 13,
              decoration: TextDecoration.underline,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
