import 'dart:async';

import 'package:famplay/domain/model/user/profile.dart';
import 'package:famplay/domain/model/user/user_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:famplay/presenter/ui/widget/son/son_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<UserModel> childs = [];
  final StreamController<UserModel> _controller =
      StreamController<UserModel>.broadcast();

  @override
  void initState() {
    super.initState();
    _controller.stream.listen((item) {
      setState(() {
        childs.add(item);
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void addChild() {
    setState(() {
      final id = childs.length + 1;
      final name = 'Filho $id';
      final email = 'email $id@email.com';
      final password = 'password $id@4321@$id';
      const image =
          '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';
      const profile = Profile.child;
      childs.add(
        UserModel(
            id: id,
            name: name,
            email: email,
            password: password,
            image: image,
            profile: profile),
      );
    });
  }

  void removeChild(int id) {
    setState(() {
      childs.removeWhere((son) => son.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.filhos),
        title: 'Filhos',
        showBack: false,
        showLogoff: true,
        color: ColorsConstants.brown,
        backgroundColor: ColorsConstants.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(ImageConstants.whiteBg).image,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...childs.map(
                (son) => Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsConstants.orange,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: SonTile(
                          user: son,
                          validate: false,
                        ),
                      ),
                      IconButton(
                        iconSize: 20,
                        color: ColorsConstants.white,
                        onPressed: () {
                          removeChild(son.id);
                        },
                        icon: const Icon(FamplayIcons.trash),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(64),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/register/son', arguments: {
                      'isCreate': true,
                    });
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: ColorsConstants.white,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(FamplayIcons.add),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Adicionar filho',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
