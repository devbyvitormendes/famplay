import 'dart:async';

import 'package:famplay/domain/model/prize/prize_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/widget/app_bar_widget.dart';
import 'package:famplay/presenter/ui/widget/prize/prize_tile.dart';
import 'package:flutter/material.dart';
    
class PrizePage extends StatefulWidget {
  const PrizePage({super.key});

  @override
  State<PrizePage> createState() => _PrizePageState();
}

class _PrizePageState extends State<PrizePage> {
  final List<PrizeModel> prizes = [];
  final StreamController<PrizeModel> _controller =
      StreamController<PrizeModel>.broadcast();

  @override
  void initState() {
    super.initState();
    _controller.stream.listen((item) {
      setState(() {
        prizes.add(item);
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void addprize() {
    setState(() {
      final id = prizes.length + 1;
      // final description = '15 dias na Disney com tudo pago, direito a acompanhante e serviço de quarto mais uma carteira com 15 mil dólares pra gastar $id';
      final description = 'Preminho bala $id';
      final cost = id * 3;
      prizes.add(
        PrizeModel(
          id: id,
          description: description,
          cost: cost,
        ),
      );
    });
  }

  void removeprize(int id) {
    setState(() {
      prizes.removeWhere((prize) => prize.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      appBar: AppBarWidget(
        image: Image.asset(ImageConstants.tarefas),
        title: 'Prêmios',
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
              ...prizes.map(
                (prize) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: PrizeTile(
                          prize: prize,
                        ),
                      ),
                      IconButton(
                        iconSize: 14,
                        color: ColorsConstants.brown,
                        onPressed: () {
                          removeprize(prize.id);
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
                        .pushNamed('/register/prize', arguments: {
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
                        'Novo prêmio',
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