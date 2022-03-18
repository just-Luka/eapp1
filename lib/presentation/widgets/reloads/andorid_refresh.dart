import 'package:eapp1/domain/page_reload.dart';
import 'package:flutter/material.dart';

class AndroidRefresh extends StatelessWidget {
  final Widget child;
  static const PageReload _reload = PageReload();

  const AndroidRefresh({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      onRefresh: () => _reload.homePage(context),
      edgeOffset: 100,
      displacement: 30,
    );
  }
}
