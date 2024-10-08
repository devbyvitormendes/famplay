import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:famplay/presenter/ui/famplay_icon.dart';
import 'package:famplay/presenter/ui/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Image? image;
  final String title;
  final bool showBack;
  final bool showLogoff;
  final Color color;
  final Color backgroundColor;

  const AppBarWidget({
    super.key,
    this.image,
    required this.title,
    required this.showBack,
    required this.showLogoff,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: showBack
          ? const EdgeInsets.only(right: 10)
          : const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor: backgroundColor,
            automaticallyImplyLeading: showBack,
            iconTheme: IconThemeData(
              color: color,
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: image != null,
                  child: Row(
                    children: [
                      if (image != null)
                        Image(
                          image: image!.image,
                          color: color,
                          width: 22,
                          height: 22,
                        ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: color,
                  ),
                ),
              ],
            ),
            actions: [
              Visibility(
                visible: showLogoff,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    FamplayIcons.logout,
                    color: color,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
