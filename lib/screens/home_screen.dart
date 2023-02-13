import "package:flutter/material.dart";

import "package:mr_coffe/components/card_category.dart";
import "package:mr_coffe/components/card_product.dart";
import "package:mr_coffe/components/my_scaffold.dart";
import "package:mr_coffe/components/new_of_month.dart";
import "package:mr_coffe/data/dummy_data.dart";
import "package:mr_coffe/models/product.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MyScaffold(
      content: Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: Color.fromRGBO(218, 218, 218, 1))
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1)),
                    hintText: "Qual produto está procurando?",
                    fillColor: const Color.fromRGBO(244, 244, 244, 1)
                  )
                ),
              ),
              SizedBox(
                height: 310,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: PRODUCTS.length,
                  itemBuilder: (BuildContext context, int index) => CardProduct(product: PRODUCTS[index])
                )
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, top: 45, bottom: 25),
                child: const Text("Categorias", textAlign: TextAlign.left, style: TextStyle(fontSize: 18))
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: CATEGORIES.length,
                  itemBuilder: (BuildContext context, int index) => CardCategory(category: CATEGORIES[index])
                )
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, top: 45, bottom: 25),
                child: const Text("Novidades do Mês", textAlign: TextAlign.left, style: TextStyle(fontSize: 18))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: NEW_OF_MONTH.map((Product product) => NewOfMonth(product: product)).toList()
                )
              ),
              const SizedBox(height: 40),
              Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: const <Widget>[
                    Text("Prototipado por Felipe Maciel", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    Text("Desenvolvido por Mário Guilherme", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    Text("©2023 - Flutter 3.0.5", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))
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