import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/domain/providers/hotel_provider.dart';
import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SavePage extends StatelessWidget {
  static List<HotelModel> savedHotels = [
    HotelModel.encapsulate(
        id: "1",
        location: "Tbilisi, Georgia",
        name: "Name 1",
        per: "Day",
        star: "4.5",
        price: "50.00"),
    HotelModel.encapsulate(
        id: "2",
        location: "Tbilisi, Georgia",
        name: "Name 2",
        per: "Day",
        star: "2.5",
        price: "60.00"),
    HotelModel.encapsulate(
        id: "3",
        location: "Tbilisi, Georgia",
        name: "Name 3",
        per: "Day",
        star: "5.0",
        price: "49.99"),
  ];

  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        DefaultAppbar(
          title: AppLocalizations.of(context)!.savePageTitle1 + '\n',
          metaTitle: AppLocalizations.of(context)!.savePageTitle2,
        ),
        SliverToBoxAdapter(
          child: HomeCenterFrame(
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Consumer<HotelProvider>(
                builder: (context, data, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.hotels.length,
                    itemBuilder: (context, index) {
                      return Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Text(data.hotels[index].id),
                          Text(data.hotels[index].name),
                          Text(data.hotels[index].price),
                          Text(data.hotels[index].location),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
