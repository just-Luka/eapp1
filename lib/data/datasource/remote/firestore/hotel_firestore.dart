import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class HotelFirestore extends BaseFirestore{
  HotelFirestore() : super(
    reference: 'hotels'
  );
}