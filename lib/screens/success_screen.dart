import "dart:async";

import "package:flutter/material.dart";
import "package:mr_coffe/util/routes.dart";

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 2300), () => Navigator.pushReplacementNamed(context, Routes.home));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/images/success.gif"))
    );
  }
}