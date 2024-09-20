import 'dart:convert';
import 'dart:developer';

import 'package:famplay/domain/model/user/user_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class SonTile extends StatelessWidget {
  final UserModel user;

  const SonTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('son: $user');
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: ColorsConstants.white,
                    child: Center(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            Image.memory(base64Decode(user.image)).image,
                        backgroundColor: ColorsConstants.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: ColorsConstants.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
