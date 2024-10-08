import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/pages/home_page.dart';
import 'package:famplay/presenter/ui/pages/prize_page.dart';
import 'package:famplay/presenter/ui/pages/task_page.dart';
import 'package:famplay/presenter/ui/pages/validate_page.dart';
import 'package:flutter/cupertino.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    TaskPage(),
    PrizePage(),
    ValidatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: ColorsConstants.yellow,
        activeColor: ColorsConstants.orange,
        inactiveColor: ColorsConstants.brown,
        items: const [
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
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          return _widgetOptions.elementAt(index);
        });
      },
    );
  }
}
