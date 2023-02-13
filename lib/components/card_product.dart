import "package:flutter/material.dart";
import "package:mr_coffe/models/product.dart";
import "package:mr_coffe/util/routes.dart";

class CardProduct extends StatelessWidget {
  final Product product;

  const CardProduct({ required this.product, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.details, arguments: product),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 28),
              width: 232,
              height: 280,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(32) 
              )
            ),
            Positioned(
              top: 5,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: 232,
                child: Image.asset("assets/images/produto${this.product.id}.png", height: 250)
              )
            ),
            Positioned(
              left: 15,
              bottom: 32,
              child: Text(
                this.product.name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300
                )
              )
            ),
            const Positioned(
              left: 15,
              bottom: 20,
              child: Text(
                "R\$",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Positioned(
              left: 30,
              bottom: 7.5,
              child: Text(
                this.product.currentPriceFormatted,
                style: const TextStyle(
                  fontSize: 23.9,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Positioned(
              left: 80,
              bottom: 15,
              child: Text(
                this.product.oldPriceFormatted,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                  color: Color.fromRGBO(255, 255, 255, .31),
                  fontWeight: FontWeight.bold
                )
              )
            )
          ]
        ),
      ),
    );
  }
}