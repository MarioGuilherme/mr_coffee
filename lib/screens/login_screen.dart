import "dart:async";

import "package:flutter/material.dart";

import "package:mr_coffe/components/highlight_merged_text.dart";
import "package:mr_coffe/util/routes.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _fakeLogin(BuildContext context) => Timer(const Duration(milliseconds: 400), () => Navigator.pushReplacementNamed(context, Routes.home));

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: const AssetImage("assets/images/logo.png"),
                      width: deviceSize.width * .4
                    ),
                    SizedBox(height: deviceSize.height * .02),
                    HighlighWithNormalText(
                      normalText: "Porque todo ",
                      highlightedText: "bom dia",
                      fontSizeHighlightedText: 21,
                      highlightcolor: Theme.of(context).primaryColor,
                      highlightedTextFirst: false,
                    ),
                    HighlighWithNormalText(
                      normalText: "se inicia com um ",
                      highlightedText: "bom café",
                      fontSizeHighlightedText: 21,
                      highlightcolor: Theme.of(context).primaryColor,
                      highlightedTextFirst: false,
                    ),
                    SizedBox(height: deviceSize.height * .08),
                    ElevatedButton(
                      onPressed: () => this._fakeLogin(context),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(0, 147, 94, 1),
                        shape: const StadiumBorder(),
                        fixedSize: Size(deviceSize.width, 48)
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: deviceSize.width * .1,
                            child: const Icon(Icons.email)
                          ),
                          SizedBox(
                            width: deviceSize.width * .65,
                            child: const Text("Acessar com o email", textAlign: TextAlign.center)
                          )
                        ]
                      )
                    ),
                    SizedBox(height: deviceSize.height * .016),
                    ElevatedButton(
                      onPressed: () => this._fakeLogin(context),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(56, 106, 237, 1),
                        shape: const StadiumBorder(),
                        fixedSize: Size(deviceSize.width, 48)
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: deviceSize.width * .1,
                            child: const Icon(Icons.facebook)
                          ),
                          SizedBox(
                            width: deviceSize.width * .65,
                            child: const Text("Acessar com o Facebook", textAlign: TextAlign.center)
                          )
                        ]
                      )
                    ),
                    SizedBox(height: deviceSize.height * .016),
                    ElevatedButton(
                      onPressed: () => this._fakeLogin(context),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 177, 177, 177),
                        shape: const StadiumBorder(),
                        fixedSize: Size(deviceSize.width, 48)
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: deviceSize.width * .1,
                            child: const Image(image: AssetImage("assets/images/icons/google.png"), height: 24)
                          ),
                          SizedBox(
                            width: deviceSize.width * .65,
                            child: const Text(
                              "Acessar com o Google",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              ),
              const Text("Não tem conta? Cadastre-se", style: TextStyle(color: Color.fromARGB(255, 73, 73, 73)))
            ]
          )
        )
      )
    );
  }
}