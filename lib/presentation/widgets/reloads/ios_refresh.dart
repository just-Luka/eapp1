import 'package:flutter/cupertino.dart';

class IosRefresh extends StatelessWidget {
  final Widget child;
  final Future Function() onRefresh;
  final ScrollController? controller;

  const IosRefresh({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 260,
            child: child,
          ),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
      ],
    );
  }
}
