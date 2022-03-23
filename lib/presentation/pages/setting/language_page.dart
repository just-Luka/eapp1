import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/providers/app_provider.dart';
import 'package:eapp1/presentation/widgets/frames/home_center_frame.dart';
import 'package:eapp1/presentation/widgets/texts/setting_headline_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  static String _language = AppRepository().getLocale();

  void _updateRadio(value) {
    setState(() {
      _language = value;
    });
  }

  void _updateLanguage() {
    Provider.of<AppProvider>(context, listen: false).updateLanguage(_language);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeCenterFrame(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const SettingHeadlineText(
              textLeft: 'Choose Language',
            ),
            for (var item in AppConfig.locales)
              ListTile(
                title: Text(item.toString().toUpperCase()),
                leading: Radio(
                  value: item.toString(),
                  groupValue: _language,
                  onChanged: _updateRadio,
                ),
              ),
            const SizedBox(
              height: 260,
            ),
            SizedBox(
              width: 120,
              height: 50,
              child: ElevatedButton(
                onPressed: _updateLanguage,
                child: Text(
                  AppLocalizations.of(context)!.accept,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 8, 124, 201)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
