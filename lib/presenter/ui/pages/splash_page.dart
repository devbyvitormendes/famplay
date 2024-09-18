import 'package:famplay/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/auth/login');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageConstants.starLogoSmiling,
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'FAMPLAY',
              style: TextStyle(
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: ColorsConstants.brown),
            ),
          ),
        ],
      ),
    );
  }
}
