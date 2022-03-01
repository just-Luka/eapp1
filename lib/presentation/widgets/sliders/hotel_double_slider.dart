import 'package:eapp1/presentation/widgets/clippers/distance_clipper.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/hotel_card.dart';
import 'package:eapp1/presentation/widgets/icons/location_icon.dart';
import 'package:eapp1/presentation/widgets/icons/star_icon.dart';
import 'package:eapp1/presentation/widgets/texts/hotel_title_text.dart';
import 'package:eapp1/presentation/widgets/texts/price_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelDoubleSlider extends StatelessWidget {

  const HotelDoubleSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
      child: SizedBox(
          height: 260,
          child: PageView(
            children: [
              HomeCenterFrame(
                child: Column(
                  children: const [
                    HotelCard(),
                    SizedBox(height: 12),
                    HotelCard(),
                  ],
                ),
              ),
              HomeCenterFrame(
                child: Column(
                  children: const [
                    HotelCard(),
                    SizedBox(height: 12),
                    HotelCard(),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
