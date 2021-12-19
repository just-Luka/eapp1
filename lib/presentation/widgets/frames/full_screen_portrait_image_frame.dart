import 'package:flutter/material.dart';

class FullScreenPortraitImageFrame extends StatelessWidget {
  final String image;

  const FullScreenPortraitImageFrame({
    Key? key,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
