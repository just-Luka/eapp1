import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/home_chip.dart';
import 'package:eapp1/presentation/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
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
    );
  }
}
