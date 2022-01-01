import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: <Widget>[
        DefaultAppbar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: const Color.fromRGBO(236, 236, 236, 1.0),
                  );
                },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
