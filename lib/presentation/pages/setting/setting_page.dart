import 'package:eapp1/domain/providers/app_provider.dart';
import 'package:eapp1/internal/dependency/app_theme.dart';
import 'package:eapp1/presentation/pages/setting/language_page.dart';
import 'package:eapp1/presentation/widgets/buttons/setting_button.dart';
import 'package:eapp1/presentation/widgets/cards/setting/user_in_card.dart';
import 'package:eapp1/presentation/widgets/cards/setting/user_out_card.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/frames/setting_center_frame.dart';
import 'package:eapp1/presentation/widgets/texts/setting_headline_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: SizedBox(height: 70),
        ),
        const SliverToBoxAdapter(
          child: HomeCenterFrame(
            child: SettingHeadlineText(
              textLeft: 'Account',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.data == null) {
                return const UserOutCard();
              }
              return const UserInCard();
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: HomeCenterFrame(
            child: SettingHeadlineText(
              textLeft: 'General',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SettingCenterFrame(
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.spaceAround,
              children: [
                SettingButton(
                  color: Theme.of(context).darkModeBackground,
                  icon: Icon(
                    Icons.dark_mode,
                    size: 45,
                    color: Theme.of(context).darkModeIcon,
                  ),
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .switchTheme();
                  },
                ),
                SettingButton(
                  color: Theme.of(context).cardColor,
                  icon: Icon(
                    Icons.language,
                    size: 45,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguagePage(),
                      ),
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.data == null) {
                return const SizedBox();
              }
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => {
                        print('clicked'),
                      },
                      child: Text(
                        'Sing out',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 223, 35, 35),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
