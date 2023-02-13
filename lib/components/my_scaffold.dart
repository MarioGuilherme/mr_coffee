import "package:flutter/material.dart";

class MyScaffold extends StatelessWidget {
  final Widget content;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String _getGreetings() {
    final int hours = DateTime.now().hour;

    if (hours >= 12 && hours <= 17) return "Boa tarde";
    if (hours >= 18 || hours <= 5) return "Boa noite";

    return "Bom dia";
  }

  MyScaffold({
    required this.content,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerScrimColor: Colors.transparent,
      endDrawerEnableOpenDragGesture: false,
      endDrawer: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 75),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: DrawerHeader(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                    margin: const EdgeInsets.all(0),
                    child: const Text(
                      "MENU",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white
                      )
                    )
                  )
                )
              ]
            )
          )
        )
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 2
              ),
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this._getGreetings(), style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 3),
                      const Text("Deconhecido(a)", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Tooltip(
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(32)),
                        triggerMode: TooltipTriggerMode.tap,
                        message: "CESTA",
                        child: Stack(
                          children: <Widget>[
                            const Icon(Icons.shopping_bag_rounded, size: 34),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.only(left: 3, right: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).primaryColor
                                ),
                                child: const Text(
                                  "0",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12
                                  )
                                )
                              )
                            )
                          ]
                        )
                      ),
                      const SizedBox(width: 4),
                      InkWell(onTap: () => _key.currentState!.openEndDrawer(), child: const Icon(Icons.menu, size: 32))
                    ]
                  )
                ]
              )
            ),
            this.content
          ]
        )
      )
    );
  }
}