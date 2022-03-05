import 'dart:ui';

import 'package:eapp1/domain/cubit/firestore/slider_cubit.dart';
import 'package:eapp1/presentation/widgets/frames/listview_center_frame.dart';
import 'package:eapp1/presentation/widgets/icons/bookmark_icon.dart';
import 'package:eapp1/presentation/widgets/icons/location_icon.dart';
import 'package:eapp1/presentation/widgets/icons/star_icon.dart';
import 'package:eapp1/presentation/widgets/price_oval_banner.dart';
import 'package:eapp1/presentation/widgets/texts/hotel_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          if (state is SliderLoading) {
            return const Center(
              child: Text("Waiting..."),
            );
          } else if (state is SliderLoaded) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.model.length,
              itemBuilder: (context, index) {
                return ListViewCenterFrame(
                  itemDistance: 25,
                  child: Stack(
                    children: [
                      Container(
                        width: 250,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.indigo,
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://www.planetware.com/wpimages/2020/01/best-underwater-hotels-muraka-conrad-maldives-rangali-island.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 190, top: 10),
                        child: BookmarkIcon(hotel: state.model[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 150),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              width: 200.0,
                              height: 88.0,
                              color: Colors.black.withOpacity(0.1),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HotelTitleText(
                                      textColor: Colors.white,
                                      text: state.model[index].name,
                                    ),
                                    SizedBox(height: 5),
                                    LocationIcon(
                                      color: Colors.white,
                                      text: state.model[index].location,
                                    ),
                                    SizedBox(height: 5),
                                    StarIcon(
                                      textColor: Colors.white,
                                      star: state.model[index].star,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 80, top: 218),
                          child: PriceOvalBanner(
                            price: state.model[index].price,
                            per: state.model[index].per,
                          )),
                    ],
                  ),
                  index: index,
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
