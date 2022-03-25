import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Btn1Button extends StatelessWidget {
  final Function() callback;
  final String text;

  const Btn1Button({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 17,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 8, 124, 201)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
      ),
    );
  }
}
