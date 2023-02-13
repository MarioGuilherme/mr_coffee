import "dart:async";

import "package:flutter/material.dart";
import "package:mr_coffe/store/item.cart.store.dart";
import "package:mr_coffe/util/routes.dart";
import "package:provider/provider.dart";

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemCartStore store = Provider.of<ItemCartStore>(context);
    store.quantity = 0;
    store.totalPrice = 0.0;

    Timer(const Duration(milliseconds: 2000), () => Navigator.pushReplacementNamed(context, Routes.success));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(backgroundColor: Colors.white),
            const SizedBox(height: 10),
            Text("Processando pedido...", style: TextStyle(color: Theme.of(context).primaryTextTheme.headline6?.color))
          ]
        )
      )
    );
  }
}