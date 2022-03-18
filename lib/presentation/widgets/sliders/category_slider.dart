import 'dart:io';

import 'package:eapp1/domain/cubit/firestore/slider_cubit.dart';
import 'package:eapp1/presentation/widgets/frames/listview_center_frame.dart';
import 'package:eapp1/presentation/widgets/hotel_big_card.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySlider extends StatefulWidget {
  const CategorySlider({Key? key}) : super(key: key);

  @override
  State<CategorySlider> createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  final ScrollController _controller = ScrollController();
  int distance = 70; // offset
  bool isActive = false;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      double outRangeLoading = distance + _controller.position.maxScrollExtent;
      double currentPixel = _controller.position.pixels;

      if (_controller.position.maxScrollExtent <= currentPixel) {
        if (currentPixel >= outRangeLoading) {
          isActive = true;
          BlocProvider.of<SliderCubit>(context).sliderLazyLoad().then((value) {
            progress = 0.0;
            isActive = false;
          });
        }

        calculateProgress(outRangeLoading, currentPixel);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Some math
  void calculateProgress(outRangeLoading, currentPixel) {
    double current, currentAsPrecent;

    current = outRangeLoading - currentPixel;
    currentAsPrecent = (100 * current) / distance;

    setState(() {
      progress = (100 - currentAsPrecent) * 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) {
          if (state is SliderLoading) {
            return const CupertinoActivityIndicator();
          } else if (state is SliderLoaded) {
            return Stack(
              children: [
                Positioned(
                  right: 15,
                  top: 123,
                  child: isActive
                      ? const CupertinoActivityIndicator()
                      : CupertinoActivityIndicator.partiallyRevealed(
                          progress: progress,
                        ),
                ),
                ListView.builder(
                  itemCount: state.model.length + 1,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  controller: state.completely ? null : _controller,
                  itemBuilder: (context, index) {
                    if (index == state.model.length) {
                      return isActive
                          ? const SizedBox(width: 50)
                          : const SizedBox();
                    }
                    return ListViewCenterFrame(
                      itemDistance: 25,
                      child: HotelBigCard(
                        hotelModel: state.model[index],
                      ),
                      index: index,
                    );
                  },
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
