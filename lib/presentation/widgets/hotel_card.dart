import 'package:eapp1/presentation/widgets/clippers/distance_clipper.dart';
import 'package:eapp1/presentation/widgets/icons/location_icon.dart';
import 'package:eapp1/presentation/widgets/icons/star_icon.dart';
import 'package:eapp1/presentation/widgets/texts/hotel_title_text.dart';
import 'package:eapp1/presentation/widgets/texts/price_text.dart';
import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 13),
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.0),
                child: Image.network('https://www.akamai.com/site/im-demo/perceptual-standard.jpg?imbypass=true',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HotelTitleText(textColor: Colors.black),
                  SizedBox(height: 4),
                  LocationIcon(color: Colors.black),
                  SizedBox(height: 4),
                  StarIcon(textColor: Colors.black),
                  SizedBox(height: 4),
                  PriceText(
                    priceColor: Colors.orange,
                    textColor: Colors.black,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ClipPath(
                clipper: DistanceClipper(),
                child: Container(
                  height: 50,
                  color: Colors.indigoAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
