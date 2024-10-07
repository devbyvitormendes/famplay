import 'package:famplay/domain/model/user/profile.dart';
import 'package:famplay/domain/model/user/user_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:famplay/presenter/ui/widget/son/son_tile.dart';
import 'package:flutter/material.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({super.key});

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  final List<UserModel> childs = [
    UserModel(
      id: 1,
      name: 'João',
      email: 'johnny@example.com',
      profile: Profile.child,
      parentId: 1,
      password: '',
      image: '',
    ),
    UserModel(
      id: 2,
      name: 'Joaquim',
      email: 'quinzinho@example.com',
      profile: Profile.child,
      parentId: 1,
      password: '',
      image: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.validar),
        title: 'Validar',
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
                          validate: true,
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
