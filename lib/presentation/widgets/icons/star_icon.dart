import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarIcon extends StatelessWidget {
  final Color textColor;
  final String star;

  const StarIcon({
    Key? key,
    required this.textColor,
    required this.star
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.star,
              size: 17,
              color: Colors.yellow,
            ),
          ),
          TextSpan(
            text: star,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
