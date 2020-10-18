import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:WolfBeat/core/view_model/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/view_model/player/player_view_model.dart';
import '../../home/pages/home_page.dart';
import '../../library/pages/library_page.dart';
import '../../search/pages/search_page.dart';
import '../../ui_components/mini_player.dart';

class BottomNavigator extends StatefulWidget {
  static final String id = 'bottom_navigator';

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
  ];

  final playerViewModel = GetIt.I.get<PlayerViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      // bottomSheet: Observer(
      //   builder: (context) =>
      //       playerViewModel.playerQueue[playerViewModel.currentIndex] != null
      //           ? MiniPlayer()
      //           : SizedBox(),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF2c2f33),
        elevation: 0.0,
        selectedItemColor: Color(0xFFF0F0F5),
        selectedLabelStyle: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Color(0xFFF0F0F5),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        unselectedItemColor: Color(0xFF757575),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Color(0xFFF0F0F5),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        iconSize: 25.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.home_mdi),
            label: 'Página inicial',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.search_mdi),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.library_music_outline_mco),
            label: 'Biblioteca',
          ),
        ],
      ),
    );
  }
}
