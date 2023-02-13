import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "package:mr_coffe/components/my_scaffold.dart";
import "package:mr_coffe/components/quantity_buttons.dart";
import "package:mr_coffe/components/table_payments_method.dart";
import "package:mr_coffe/models/product.dart";
import "package:mr_coffe/store/item.cart.store.dart";
import "package:mr_coffe/util/routes.dart";

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemCartStore store = Provider.of<ItemCartStore>(context);
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return MyScaffold(
      content: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                  bottom: 21
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 63,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(32)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: <Widget>[
                                Positioned(
                                  bottom: 7,
                                  left: 36,
                                  child: Image.asset(height: 85, "assets/images/produto${product.id}.png")
                                )
                              ]
                            )
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  style: const TextStyle(color: Colors.white, fontSize: 16)
                                ),
                                const Text(
                                  "GRANDE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            )
                          ),
                          Expanded(
                            flex: 3,
                            child: Observer(builder: (_) => QuantityButtons(price: product.currentPrice))
                          ),
                          const SizedBox(width: 15)
                        ]
                      )
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                fixedSize:Size(MediaQuery.of(context).size.width - 30, 63),
                                side: BorderSide(color: Theme.of(context).primaryColor),
                                shape: const StadiumBorder()
                              ),
                              child: const Text(
                                "ADICIONAR MAIS ITEMS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            )
                          ]
                        )
                      ],
                    ),
                    const SizedBox(height: 38),
                    const Text(
                      "Compre também",
                      style: TextStyle(fontSize: 16, color: Color.fromRGBO(176, 176, 176, 1))
                    )
                  ]
                )
              ),
              SizedBox(
                height: 186,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    int myIndex = index + 1;
                    myIndex = myIndex >= 4 ? myIndex - 3 : myIndex;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 186,
                      width: 186,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset(
                          "assets/images/sugestao$myIndex.png",
                          fit: BoxFit.cover
                        )
                      )
                    );
                  }
                )
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 21,
                  left: 15,
                  right: 15
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      "Forma de pagamento",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(176, 176, 176, 1)
                      )
                    ),
                    const SizedBox(height: 23),
                    const TablePaymentsMethod(),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, Routes.loading),
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(0, 255, 255, 255),
                        fixedSize: const Size(double.infinity, 55),
                        shape: const StadiumBorder()
                      ),
                      child: Observer(
                        builder: (_) => Text(
                          "PAGAR R\$ ${store.totalPriceFormatted}",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                        )
                      )
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      "Tempo estimado de entrega 30-60 min",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Color.fromRGBO(176, 176, 176, 1))
                    ),
                    const SizedBox(height: 6),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}