import "package:flutter/material.dart";

class HighlighWithNormalText extends StatelessWidget {
  final String highlightedText;
  final String normalText;
  final bool highlightedTextFirst;
  final Color highlightcolor;
  final double fontSizeHighlightedText;

  const HighlighWithNormalText({
    required this.highlightedText,
    required this.highlightcolor,
    required this.normalText,
    required this.highlightedTextFirst,
    required this.fontSizeHighlightedText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: this.highlightedTextFirst ? TextDirection.rtl : TextDirection.ltr,
      children: <Widget>[
        Text(
          this.normalText,
          style: TextStyle(
            fontSize: this.fontSizeHighlightedText,
            color: this.highlightcolor
          )
        ),
        Text(
          this.highlightedText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: this.fontSizeHighlightedText,
            color: this.highlightcolor
          )
        )
      ]
    );
  }
}