import 'package:badges/badges.dart';
import 'package:eapp1/custom_icons.dart';
import 'package:eapp1/domain/providers/hotel_provider.dart';
import 'package:eapp1/presentation/pages/home/home_page.dart';
import 'package:eapp1/presentation/pages/location_page.dart';
import 'package:eapp1/presentation/pages/save_page.dart';
import 'package:eapp1/presentation/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int _currentIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    LocationPage(),
    SavePage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: AppRepository().getIsFirstBootstrap() ? WelcomePage() : const HomePage(),
    // );
    return ChangeNotifierProvider(
      create: (_) => HotelProvider(),
      child: Scaffold(
        body: IndexedStack(
          children: _pages,
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(CustomIcons.home_svgrepo_com),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Consumer<HotelProvider>(
                builder: (context, data, child) {
                  return Badge(
                    //TODO clicking problem
                    child: InkWell(
                      child: const Icon(Icons.bookmark_border_outlined),
                      onTap: () {
                        Provider.of<HotelProvider>(context, listen: false)
                            .unseenBadges
                            .clear();
                      },
                    ),
                    badgeContent: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        data.unseenBadges.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    badgeColor: const Color.fromRGBO(53, 133, 255, 1.0),
                    animationType: BadgeAnimationType.fade,
                    showBadge: data.unseenBadges.length > 0 ? true : false,
                  );
                },
              ),
              label: 'Saves',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          iconSize: 27,
        ),
      ),
    );
  }
}
