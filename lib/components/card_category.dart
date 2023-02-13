import "package:flutter/material.dart";

import "package:mr_coffe/models/category.dart";

class CardCategory extends StatelessWidget {
  final Category category;

  const CardCategory({
    required this.category,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset.zero,
            color: Color.fromRGBO(0, 0, 0, .24),
            blurRadius: 4,
            spreadRadius: 0
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/icons/icone${this.category.id}.png", width: 46, height: 46)
            ]
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.category.name, style: const TextStyle(fontSize: 12)),
              Text(
                "${this.category.totalOptions.toString().padLeft(2, "0")} opções",
                style: TextStyle(color: Theme.of(context).primaryColor)
              )
            ]
          )
        ]
      )
    );
  }
}