import "package:flutter/material.dart";

import "package:mr_coffe/models/product.dart";

class NewOfMonth extends StatelessWidget {
  final Product product;

  const NewOfMonth({
    required this.product,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset("assets/images/produto${this.product.id}.png", fit: BoxFit.cover)
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: MediaQuery.of(context).size.width - 176,
            height: 128,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(child: Text(this.product.name, style: const TextStyle(fontSize: 16))),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "R\$ ${this.product.currentPrice}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22
                      )
                    ),
                    if (this.product.oldPrice != null)
                      const SizedBox(width: 8),
                    if (this.product.oldPrice != null)
                      Text(
                        "R\$ ${this.product.oldPrice!}",
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 11)
                      )
                  ]
                )
              ]
            )
          )
        ]
      )
    );
  }
}