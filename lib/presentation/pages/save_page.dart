import 'package:eapp1/domain/providers/hotel_provider.dart';
import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/cards/hotel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final hotelProvider = Provider.of<HotelProvider>(context, listen: false);

    return Consumer<HotelProvider>(
      builder: (context, value, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          DefaultAppbar(
            title: AppLocalizations.of(context)!.savePageTitle1 + '\n',
            metaTitle: AppLocalizations.of(context)!.savePageTitle2,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.06,
                    right: width * 0.04,
                    top: 7.5,
                    bottom: 7.5,
                  ),
                  child: HotelCard(
                    hotelModel: value.hotels[index],
                  ),
                );
              },
              childCount: hotelProvider.hotels.length,
            ),
          ),
        ],
      ),
    );
  }
}
