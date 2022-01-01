import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultAppbar extends StatelessWidget {
  const DefaultAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      toolbarHeight: 100,
      expandedHeight: 100,
      floating: true,
      title: Padding(
        padding: EdgeInsets.only(left: width*0.04),
        child: RichText(
          text: TextSpan(
              style: const TextStyle(
                height: 1.3,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: AppLocalizations.of(context)!.homePageTitle1 + '\n',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.homePageTitle2,
                  style: responsiveStyle(context),
                ),
              ]
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: width*0.04),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0.0, 7)
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
            ),
          ),
        ),
      ],
      // pinned: true,
    );
  }

  TextStyle responsiveStyle(BuildContext context) {
    String locale = AppLocalizations.of(context)!.localeName;

    switch (locale){
      case 'ka':
        return GoogleFonts.poppins(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
      default:
        return GoogleFonts.poppins(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
    }
  }
}
