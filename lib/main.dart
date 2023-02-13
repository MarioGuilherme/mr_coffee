import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:provider/provider.dart";

import "package:mr_coffe/screens/confirm_payment_screen.dart";
import "package:mr_coffe/screens/detail_screen.dart";
import "package:mr_coffe/screens/home_screen.dart";
import "package:mr_coffe/screens/loading_screen.dart";
import "package:mr_coffe/screens/login_screen.dart";
import "package:mr_coffe/screens/splash_screen.dart";
import "package:mr_coffe/screens/success_screen.dart";
import "package:mr_coffe/store/item.cart.store.dart";
import "package:mr_coffe/util/routes.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[ DeviceOrientation.portraitUp ]);

    return MultiProvider(
      providers: <Provider<Object>>[
        Provider<ItemCartStore>(create: (_) => ItemCartStore())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mr. Coffee",
        theme: ThemeData(
          primarySwatch: Palette.mainColor,
          fontFamily: "Roboto"
        ),
        home: const SplashScreen(),
        routes: <String, Widget Function(BuildContext)>{
          Routes.splash: (BuildContext context) => const SplashScreen(),
          Routes.login: (BuildContext context) => const LoginScreen(),
          Routes.home: (BuildContext context) => const HomeScreen(),
          Routes.details: (BuildContext context) => const DetailScreen(),
          Routes.confirmPayment: (BuildContext context) => const ConfirmPaymentScreen(),
          Routes.loading: (BuildContext context) => const LoadingPage(),
          Routes.success: (BuildContext context) => const SuccessScreen()
        }
      )
    );
  }
}

class Palette {
  static const MaterialColor mainColor = MaterialColor(
    0xFF00935E,
    <int, Color>{
      50: Color(0xFF00935E),
      100: Color(0xFF00935E),
      200: Color(0xFF00935E),
      300: Color(0xFF00935E),
      400: Color(0xFF00935E),
      500: Color(0xFF00935E),
      600: Color(0xFF00935E),
      700: Color(0xFF00935E)
    }
  );
}