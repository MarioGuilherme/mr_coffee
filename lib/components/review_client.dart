import "package:flutter/material.dart";
import "package:mr_coffe/models/review.dart";

class ReviewClient extends StatelessWidget {
  final Review review;

  const ReviewClient({
    required this.review,
    Key? key
  }) : super(key: key);

  List<Widget> _renderStars() {
    List<Widget> stars = <Widget>[];

    for (int i = 0; i < 5; i++)
      stars.add(const Icon(Icons.star, size: 15, color: Color.fromARGB(255, 197, 197, 197)));

    stars.removeRange(0, this.review.pontuation.toInt());

    for (int i = 0; i < this.review.pontuation.toInt(); i++)
      stars.add(const Icon(Icons.star, size: 15, color: Color.fromRGBO(255, 135, 48, 1)));

    return stars.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(196, 196, 196, 1),
              child: Text(this.review.charsPhoto, style: const TextStyle(color: Colors.white, fontSize: 17))
            ),
            const SizedBox(width: 9),
            SizedBox(
              width: MediaQuery.of(context).size.width - 81,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(this.review.name, textAlign: TextAlign.start, style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 3),
                      Text(
                        this.review.dateFormatted,
                        style: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1), fontSize: 10)
                      )
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        this.review.pontuation.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21)
                      ),
                      const SizedBox(width: 6),
                      Row(
                        children: this._renderStars()
                      )
                    ]
                  )
                ]
              )
            )
          ]
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.review.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1), fontSize: 10)
            )
          ]
        ),
        const SizedBox(height: 20)
      ]
    );
  }
}