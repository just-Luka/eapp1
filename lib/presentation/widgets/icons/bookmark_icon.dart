import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/domain/cubit/firestore/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkIcon extends StatefulWidget {
  final HotelModel hotel;

  const BookmarkIcon({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  bool ismarked = false;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        BlocProvider.of<HotelCubit>(context).addBookmark(widget.hotel);

        setState(() {
          ismarked = !ismarked;
        });
      },
      fillColor: Colors.black.withOpacity(0.1),
      child: Icon(
        ismarked ? Icons.bookmark_add : Icons.bookmark_add_outlined,
        color: Colors.white,
        size: 22.0,
      ),
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
    );
  }
}
