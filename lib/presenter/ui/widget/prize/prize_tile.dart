import 'dart:developer';

import 'package:famplay/domain/model/prize/prize_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class PrizeTile extends StatelessWidget {
  final PrizeModel prize;

  const PrizeTile({
    super.key,
    required this.prize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('prize: ${prize.description}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            child: Text(
              prize.description,
              maxLines: 5,
              textAlign: TextAlign.justify,
              textWidthBasis: TextWidthBasis.parent,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: ColorsConstants.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
