import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final Widget child;
  final double height;
  final EdgeInsetsGeometry? margin;

  const SettingCard({
    Key? key,
    required this.child,
    required this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: -12,
            blurRadius: 20,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
