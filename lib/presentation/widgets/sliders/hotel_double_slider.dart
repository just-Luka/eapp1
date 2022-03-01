import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/hotel_card.dart';
import 'package:flutter/material.dart';
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
