import 'package:eapp1/presentation/pages/auth/login_page.dart';
import 'package:eapp1/presentation/pages/auth/register_page.dart';
import 'package:eapp1/presentation/widgets/buttons/setting_button.dart';
import 'package:eapp1/presentation/widgets/frames/setting_center_frame.dart';
import 'package:flutter/material.dart';

class UserOutCard extends StatelessWidget {
  const UserOutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingCenterFrame(
      child: Wrap(
        runSpacing: 20,
        alignment: WrapAlignment.spaceAround,
        children: [
          SettingButton(
            color: Theme.of(context).cardColor,
            icon: Icon(
              Icons.login,
              size: 45,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
          SettingButton(
            color: Theme.of(context).cardColor,
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 45,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
