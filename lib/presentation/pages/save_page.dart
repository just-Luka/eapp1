import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/domain/providers/hotel_provider.dart';
import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SavePage extends StatelessWidget {
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
