import 'package:eapp1/domain/cubit/firestore/category_cubit.dart';
import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/home_chip.dart';
import 'package:eapp1/presentation/widgets/refreshes/andorid_refresh.dart';
import 'package:eapp1/presentation/widgets/search_box.dart';
import 'package:eapp1/presentation/widgets/sliders/category_slider.dart';
import 'package:eapp1/presentation/widgets/sliders/hotel_double_slider.dart';
import 'package:eapp1/presentation/widgets/texts/headline_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// TODO refresh not working
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..fetchCategory(),
      child: AndroidRefresh(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const DefaultAppbar(),
            const SliverToBoxAdapter(
              child: HomeCenterFrame(
                child: SearchBox(),
              ),
            ),
            const SliverToBoxAdapter(
                child: HomeChip()
            ),
            const SliverToBoxAdapter(
              child: CategorySlider(),
            ),
            const SliverToBoxAdapter(
              child: HomeCenterFrame(
                child: HeadlineText(),
              ),
            ),
            const SliverToBoxAdapter(
              child: HotelDoubleSlider(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        color: const Color.fromRGBO(245, 245, 245, 1.0),
                      );
                      },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
