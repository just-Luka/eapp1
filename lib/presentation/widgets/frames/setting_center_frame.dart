import 'package:flutter/material.dart';

class SettingCenterFrame extends StatelessWidget {
  final Widget child;

  const SettingCenterFrame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: (width * 0.1) + 5,
        right: (width * 0.1) + 5,
      ),
      child: child,
    );
  }
}
