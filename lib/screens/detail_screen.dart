import "dart:math";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "package:provider/provider.dart";

import "package:mr_coffe/components/review_client.dart";
import "package:mr_coffe/models/product.dart";
import "package:mr_coffe/models/review.dart";
import "package:mr_coffe/store/item.cart.store.dart";
import "package:mr_coffe/util/routes.dart";

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final Size size = MediaQuery.of(context).size;
    final ItemCartStore store = Provider.of<ItemCartStore>(context);
    store.quantity = 0;
    store.totalPrice = 0.0;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: AppBar(
              centerTitle: true,
              shadowColor: Colors.transparent,
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              actions: <Widget>[
                IconButton(
                  onPressed: () => setState(() => this.isFavorited = !this.isFavorited),
                  icon: this.isFavorited
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: Colors.white)
                )
              ],
              leading: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: const Color.fromRGBO(255, 255, 255, .29)
                ),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 36)
                )
              )
            )
          ),
        )
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: Image.asset("assets/images/produto${product.id}.png")
                )
              )
            ),
            DraggableScrollableSheet(
              initialChildSize: .54,
              minChildSize: .53,
              snap: true,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(48),
                            topRight: Radius.circular(48)
                          ),
                          color: Colors.white),
                          width: size.width,
                          height: size.height,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: 4,
                                width: size.width * .45,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(196, 196, 196, 1),
                                  borderRadius: BorderRadius.circular(32)
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 20
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        "Detalhes",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24
                                        )
                                      ),
                                      const SizedBox(height: 15),
                                      const Text(
                                        "It has survived not only five centuries, but also the leap into electronic typesetting",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(176, 176, 176, 1)
                                        ),
                                        textAlign: TextAlign.left
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            height: 55,
                                            width: 160,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(color: Theme.of(context).primaryColor)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: ElevatedButton(
                                                    onPressed: () => store.dec(product.currentPrice),
                                                    style: ElevatedButton.styleFrom(
                                                      shape: const CircleBorder(),
                                                      primary: Colors.transparent,
                                                      shadowColor: Colors.transparent,
                                                      onPrimary: Theme.of(context).primaryColor
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
                                                      style: TextStyle(
                                                        color: Theme.of(context).primaryColor,
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.bold
                                                      )
                                                    )
                                                  )
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: ElevatedButton(
                                                    onPressed: () => store.inc(product.currentPrice),
                                                    style: ElevatedButton.styleFrom(
                                                      shape: const CircleBorder(),
                                                      primary: Colors.transparent,
                                                      shadowColor: Colors.transparent,
                                                      onPrimary: Theme.of(context).primaryColor
                                                    ),
                                                    child: const Icon(Icons.add)
                                                  )
                                                )
                                              ]
                                            )
                                          ),
                                          ElevatedButton(
                                            onPressed: () => Navigator.pushNamed(context, Routes.confirmPayment, arguments: product),
                                            style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              fixedSize: const Size(double.infinity, 55),
                                              shape: const StadiumBorder()
                                            ),
                                            child: const Text(
                                              "ADICIONAR",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                              )
                                            )
                                          )
                                        ]
                                      ),
                                      const SizedBox(height: 30),
                                      const Text(
                                        "Avaliações",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(176, 176, 176, 1)
                                        )
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        height: size.height * .4,
                                        child: ListView(
                                          physics: const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          children: product.reviews!.map((Review review) => ReviewClient(review:review)).toList()
                                        )
                                      )
                                    ]
                                  )
                                )
                              )
                            ]
                          )
                        )
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromRGBO(255, 135, 48, 1),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                spreadRadius: 0,
                                blurRadius: 4,
                                color: Color.fromRGBO(0, 0, 0, .25),
                                offset: Offset(0, 4)
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "4.9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30
                                )
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                );
              }
            )
          ]
        )
      )
    );
  }
}