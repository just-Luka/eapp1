import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({Key? key}) : super(key: key);

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
              text: "4.5",
              style: GoogleFonts.poppins(
                  fontSize: 11
              )
          ),
        ],
      ),
    );
  }
}
