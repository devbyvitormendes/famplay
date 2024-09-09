import 'package:farmplay/presenter/ui/theme/farmplay_theme.dart';
import 'package:flutter/material.dart';
    
class FarmplayApp extends StatelessWidget {
  const FarmplayApp({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FamPlay',
          theme: FarmplayTheme.themeData,
          navigatorKey: PetshopNavGlobalKey.instance.navKey,
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