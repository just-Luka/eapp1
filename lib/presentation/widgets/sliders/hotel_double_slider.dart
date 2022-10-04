import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/cards/hotel_card.dart';
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
                  HotelCard(
                    hotelModel: HotelModel(
                      id: 'SomeKindaId',
                      location: 'Tbilisi, Georgia',
                      name: 'Room Hotel',
                      per: 'Month',
                      star: '5.0',
                      price: '20',
                      categoryIds: [],
                      image: "assets/images/hotels/1.jpeg",
                    ),
                  ),
                  SizedBox(height: 12),
                  HotelCard(
                    hotelModel: HotelModel(
                      id: 'SomeKindaId',
                      location: 'Tbilisi, Georgia',
                      name: 'Royal Hotel',
                      per: 'Month',
                      star: '5.0',
                      price: '20',
                      categoryIds: [],
                      image: "assets/images/hotels/2.jpeg",
                    ),
                  ),
                ],
              ),
            ),
            HomeCenterFrame(
              child: Column(
                children: const [
                  HotelCard(
                    hotelModel: HotelModel(
                      id: 'SomeKindaId',
                      location: 'Tbilisi, Georgia',
                      name: 'New Royal',
                      per: 'Month',
                      star: '5.0',
                      price: '20',
                      categoryIds: [],
                      image: "assets/images/hotels/3.jpeg",
                    ),
                  ),
                  SizedBox(height: 12),
                  HotelCard(
                    hotelModel: HotelModel(
                      id: 'SomeKindaId',
                      location: 'Tbilisi, Georgia',
                      name: 'Stay Night',
                      per: 'Month',
                      star: '5.0',
                      price: '20',
                      categoryIds: [],
                      image: "assets/images/hotels/4.jpeg",
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
