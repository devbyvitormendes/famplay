import 'dart:convert';

import 'package:famplay/domain/model/user/user_model.dart';
import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/pages/validate_tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SonTile extends StatelessWidget {
  final UserModel user;
  final bool validate;

  const SonTile({
    super.key,
    required this.user,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (validate) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => const ValidateTasksPage(),
              settings: RouteSettings(
                arguments: user,
              ),
            ),
          );
        }
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
                        backgroundImage: user.image == ''
                            ? Image.memory(
                                    base64Decode(ImageConstants.defaultImage))
                                .image
                            : Image.memory(base64Decode(user.image)).image,
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
