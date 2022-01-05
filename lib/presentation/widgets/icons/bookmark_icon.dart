import 'package:flutter/material.dart';

class BookmarkIcon extends StatelessWidget {
  const BookmarkIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      fillColor: Colors.black.withOpacity(0.1),
      child: const Icon(
        Icons.bookmark_add_outlined,
        color: Colors.white,
        size: 22.0,
      ),
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
    );
  }
}
