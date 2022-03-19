import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountText extends StatelessWidget {
  final String textLeft;
  final String textRight;

  const AccountText({
    Key? key,
    required this.textLeft,
    required this.textRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: GoogleFonts.poppins(
              fontSize: 15,
            ),
          ),
          optimizedText(textRight)
        ],
      ),
    );
  }

  Widget optimizedText(String text) {
    if (text.length >= 19) {
      return Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 11,
        ),
      );
    }

    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 15,
      ),
    );
  }
}
