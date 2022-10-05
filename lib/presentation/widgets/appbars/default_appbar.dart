import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultAppbar extends StatelessWidget {
  final String? title;
  final String? metaTitle;

  const DefaultAppbar({Key? key, this.title, this.metaTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      toolbarHeight: 100,
      expandedHeight: 100,
      floating: true,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(left: width * 0.04),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(
                height: 1.3,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color:
                        Theme.of(context).primaryTextTheme.titleMedium!.color,
                  ),
                ),
                TextSpan(
                  text: metaTitle,
                  style: responsiveStyle(context),
                ),
              ]),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.04),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0.0, 7)),
              ],
            ),
            child: CircleAvatar(
              radius: 26,
              child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
            ),
          ),
        ),
      ],
      // pinned: true,
    );
  }

  TextStyle responsiveStyle(BuildContext context) {
    String locale = AppLocalizations.of(context)!.localeName;

    switch (locale) {
      case 'ka':
        return GoogleFonts.poppins(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryTextTheme.titleLarge!.color,
        );
      default:
        return GoogleFonts.poppins(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryTextTheme.titleLarge!.color,
        );
    }
  }
}
