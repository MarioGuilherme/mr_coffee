import "dart:async";

import "package:flutter/material.dart";

import "package:mr_coffe/components/highlight_merged_text.dart";
import "package:mr_coffe/util/routes.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? _controller, _controllerBeforePush;
  Animation<double>? _opacityAnimation, _opacityAnimationBeforePush;
  Animation<Offset>? _slideAnimation, _slideAnimationBeforePush;

  bool _alreadyTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );
    _controllerBeforePush = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear
    ));
    _opacityAnimationBeforePush = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controllerBeforePush!,
      curve: Curves.linear
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, .06),
      end: const Offset(0, 0)
    ).animate(CurvedAnimation(parent: _controllerBeforePush!, curve: Curves.linear));
    _slideAnimationBeforePush = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -.06)
    ).animate(CurvedAnimation(parent: _controller!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover
          )
        ),
        child: InkWell(
          onTap: !this._alreadyTapped
            ? () {
                setState(() => this._alreadyTapped = true);
                this._controller!.forward();
                Timer(const Duration(seconds: 4), () {
                  this._controllerBeforePush!.forward();
                  Timer(const Duration(milliseconds: 300), () => Navigator.pushReplacementNamed(context, Routes.login));
                });
              }
            : null,
          child: SafeArea(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              child: FadeTransition(
                opacity: this._opacityAnimation!,
                child: SlideTransition(
                  position: this._slideAnimation!,
                  child: FadeTransition(
                    opacity: this._opacityAnimationBeforePush!,
                    child: SlideTransition(
                      position: this._slideAnimationBeforePush!,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: deviceSize.height * .17),
                          Image(
                            image: const AssetImage("assets/images/logo-splash.png"),
                            width: deviceSize.width * .4
                          ),
                          SizedBox(height: deviceSize.height * .02),
                          const HighlighWithNormalText(
                            normalText: "Porque todo ",
                            highlightedText: "bom dia",
                            fontSizeHighlightedText: 21,
                            highlightcolor: Colors.white,
                            highlightedTextFirst: false,
                          ),
                          const HighlighWithNormalText(
                            normalText: "se inicia com um ",
                            highlightedText: "bom café",
                            fontSizeHighlightedText: 21,
                            highlightcolor: Colors.white,
                            highlightedTextFirst: false,
                          )
                        ]
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    );
  }
}