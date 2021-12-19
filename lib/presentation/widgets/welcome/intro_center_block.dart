import 'package:flutter/material.dart';

class IntroCenterBlock extends StatelessWidget {
  final Widget child;

  const IntroCenterBlock({
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: width * 0.85,
        height: 700,
        child: child,
      ),
    );
  }
}
