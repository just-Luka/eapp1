import 'package:eapp1/presentation/widgets/appbars/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      ],
    );
  }
}
