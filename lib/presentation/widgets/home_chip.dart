import 'package:eapp1/presentation/widgets/frames/listview_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeChip extends StatelessWidget {
  const HomeChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListViewCenterFrame(
            itemDistance: 13,
            child: Chip(
              label: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Text('Recommended'),
              ),
              labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
              ),
              backgroundColor: const Color.fromRGBO(232, 232, 232, 1.0),
            ),
            index: index,
          );
        },
      ),
    );
  }
}
