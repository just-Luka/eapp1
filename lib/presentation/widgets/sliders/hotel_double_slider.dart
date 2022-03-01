import 'package:eapp1/presentation/widgets/clippers/distance_clipper.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 13),
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
                            SizedBox(width: 10),
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
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 13),
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
                            SizedBox(width: 10),
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
                    ),
                  ],
                ),
              ),
              HomeCenterFrame(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 13),
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
                            SizedBox(width: 10),
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
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 13),
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
                            SizedBox(width: 10),
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
                    ),


                  ],
                ),
              ),

            ],
          ),
      ),
    );
  }
}
