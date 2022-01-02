import 'package:flutter/material.dart';

class HomeCenterFrame extends StatelessWidget {
  final Widget child;

  const HomeCenterFrame({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: width*0.07, right: width*0.04),
      child: child,
    );
  }
}
