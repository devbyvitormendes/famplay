import 'package:famplay/presenter/ui/famplay_nav_global_key.dart';
import 'package:famplay/presenter/ui/pages/login_page.dart';
import 'package:famplay/presenter/ui/pages/menu_page.dart';
import 'package:famplay/presenter/ui/pages/splash_page.dart';
import 'package:famplay/presenter/ui/pages/user_register_page.dart';
import 'package:famplay/presenter/ui/theme/famplay_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
    
class FamplayApp extends StatelessWidget {
  const FamplayApp({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAMPLAY',
          theme: FamplayTheme.themeData,
          navigatorKey: FamplayNavGlobalKey.instance.navKey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/home': (_) => const MenuPage(),
            // '/unities': (_) => const UnitiesPage(),
            // '/schedule': (_) => const SchedulePage(),
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          locale: const Locale('pt', 'BR'),
        
    );
  }
}