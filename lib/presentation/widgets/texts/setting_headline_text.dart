import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingHeadlineText extends StatelessWidget {
  final String textLeft;

  const SettingHeadlineText({
    Key? key,
    required this.textLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
            ),
          )
        ],
      ),
    );
  }
}
