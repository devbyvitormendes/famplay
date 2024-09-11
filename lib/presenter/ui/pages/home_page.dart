
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: Image.asset(ImageConstants.whiteBg).image,
          ),
        ),
      ),
    );
  }
}
