import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
    
class PrizePage extends StatefulWidget {
  const PrizePage({super.key});

  @override
  State<PrizePage> createState() => _PrizePageState();
}

class _PrizePageState extends State<PrizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.premios),
        title: 'Prêmios',
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