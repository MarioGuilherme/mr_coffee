import "package:flutter/material.dart";

class TablePaymentsMethod extends StatefulWidget {
  const TablePaymentsMethod({Key? key}) : super(key: key);

  @override
  State<TablePaymentsMethod> createState() => _TablePaymentsMethodState();
}

class _TablePaymentsMethodState extends State<TablePaymentsMethod> {
  bool isFirstSelected = false;
  bool isSecondSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => setState(() {
            this.isFirstSelected = !this.isFirstSelected;
            this.isSecondSelected = false;
          }),
          child: Container(
            decoration: BoxDecoration(
              color: this.isFirstSelected
              ? Theme.of(context).primaryColor
              : null,
              border: Border.all(color: const Color.fromRGBO(218, 218, 218, 1))
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/mastercad.png",
                          height: 42,
                          width: 42,
                        )
                      ]
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Cartão de débito do aplicativo",
                          style: TextStyle(
                            fontSize: 12,
                            color: this.isFirstSelected
                              ? Colors.white
                              : const Color.fromRGBO(176, 176, 176, 1)
                          )
                        ),
                        Text(
                          "**** 1234",
                          style: TextStyle(
                            fontSize: 12,
                            color: this.isFirstSelected
                              ? Colors.white
                              : const Color.fromRGBO(176, 176, 176, 1)
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        ),
        const SizedBox(height: 7),
        InkWell(
          onTap: () => setState(() {
            this.isSecondSelected = !this.isSecondSelected;
            this.isFirstSelected = false;
          }),
          child: Container(
            decoration: BoxDecoration(
              color: this.isSecondSelected
              ? Theme.of(context).primaryColor
              : null,
              border: Border.all(color: const Color.fromRGBO(218, 218, 218, 1))
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/mastercad.png",
                          height: 42,
                          width: 42,
                        )
                      ]
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Cartão de crédito do aplicativo",
                          style: TextStyle(
                            fontSize: 12,
                            color: this.isSecondSelected
                              ? Colors.white
                              : const Color.fromRGBO(176, 176, 176, 1)
                          )
                        ),
                        Text(
                          "**** 1234",
                          style: TextStyle(
                            fontSize: 12,
                            color: this.isSecondSelected
                              ? Colors.white
                              : const Color.fromRGBO(176, 176, 176, 1)
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        )
      ]
    );
  }
}