import 'package:badges/badges.dart';
import 'package:eapp1/custom_icons.dart';
import 'package:eapp1/domain/cubit/firestore/hotel_cubit.dart';
import 'package:eapp1/presentation/pages/home/home_page.dart';
import 'package:eapp1/presentation/pages/location_page.dart';
import 'package:eapp1/presentation/pages/save_page.dart';
import 'package:eapp1/presentation/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (_) => HotelCubit(),
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
              icon: BlocConsumer<HotelCubit, HotelState>(
                builder: (context, state) {
                  if (state is HotelBookmarkAdded) {
                    if (_currentIndex == 2) {
                      state.newBadges.clear();
                    }
                    return Badge(
                      child: const Icon(Icons.bookmark_border_outlined),
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          state.newBadges.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      badgeColor: const Color.fromRGBO(53, 133, 255, 1.0),
                      animationType: BadgeAnimationType.fade,
                      showBadge: state.newBadges.isNotEmpty,
                    );
                  }
                  return const Icon(Icons.bookmark_border_outlined);
                },
                listener: (context, state) {
                  // if (_currentIndex == 2) state.newbadges.clear()
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
