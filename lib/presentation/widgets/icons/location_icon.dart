import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationIcon extends StatelessWidget {
  final Color color;

  const LocationIcon({
    Key? key,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.pin_drop,
              size: 17,
              color: color,
            ),
          ),
          TextSpan(
            text: "Tbilisi, Georgia",
            style: GoogleFonts.poppins(
              color: color,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
