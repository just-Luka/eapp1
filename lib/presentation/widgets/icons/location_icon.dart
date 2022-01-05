import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.pin_drop,
              size: 17,
              color: Colors.white,
            ),
          ),
          TextSpan(
              text: "Tbilisi, Georgia",
              style: GoogleFonts.poppins(
                  fontSize: 11
              )
          ),
        ],
      ),
    );
  }
}
