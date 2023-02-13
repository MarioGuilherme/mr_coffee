import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:mr_coffe/store/item.cart.store.dart";
import "package:provider/provider.dart";

class QuantityButtons extends StatelessWidget {
  final double price;

  const QuantityButtons({
    required this.price,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemCartStore store = Provider.of<ItemCartStore>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () => store.dec(this.price),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              onPrimary: Colors.white
            ),
            child: const Icon(Icons.remove)
          )
        ),
        Expanded(
          flex: 1,
          child: Observer(
            builder: (_) => Text(
              store.quantity.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold
              )
            )
          )
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () => store.inc(this.price),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              onPrimary: Colors.white
            ),
            child: const Icon(Icons.add)
          )
        )
      ]
    );
  }
}