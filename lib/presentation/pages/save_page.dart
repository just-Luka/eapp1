import 'package:eapp1/domain/cubit/firestore/hotel_cubit.dart';
import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:eapp1/presentation/widgets/cards/hotel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return BlocBuilder<HotelCubit, HotelState>(builder: (context, state) {
      if (state is HotelBookmarkAdded) {
        return CustomScrollView(
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
                      hotelModel: state.bookmarks[index],
                    ),
                  );
                },
                childCount: state.bookmarks.length,
              ),
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }
}
