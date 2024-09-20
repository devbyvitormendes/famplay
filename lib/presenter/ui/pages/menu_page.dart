import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/pages/home_page.dart';
import 'package:famplay/presenter/ui/pages/prize_page.dart';
import 'package:famplay/presenter/ui/pages/task_page.dart';
import 'package:famplay/presenter/ui/pages/validate_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TaskPage(),
    PrizePage(),
    ValidatePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsConstants.yellow,
        unselectedItemColor: ColorsConstants.brown,
        selectedItemColor: ColorsConstants.orange,
        currentIndex: _selectedIndex,
        selectedLabelStyle: const TextStyle(
          color: ColorsConstants.orange,
          fontWeight: FontWeight.w900,
        ),
        unselectedLabelStyle: const TextStyle(
          color: ColorsConstants.brown,
          fontWeight: FontWeight.w900,
        ),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FamplayIcons.filhos,
            label: 'Filhos',
          ),
          BottomNavigationBarItem(
            icon: FamplayIcons.tarefas,
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: FamplayIcons.premios,
            label: 'Prêmios',
          ),
          BottomNavigationBarItem(
            icon: FamplayIcons.validar,
            label: 'Validar',
          ),
        ],
      ),
    );
  }
}
