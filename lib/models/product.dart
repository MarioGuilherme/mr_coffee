import "package:mr_coffe/models/review.dart";

class Product {
  final int id;
  final String name;
  final double currentPrice;
  final double? oldPrice;
  final List<Review>? reviews;

  Product({
    required this.id,
    required this.name,
    required this.currentPrice,
    this.oldPrice,
    this.reviews
  });

  String get currentPriceFormatted => this._convertToBrazilianCurrency(this.currentPrice);
  String get oldPriceFormatted => this._convertToBrazilianCurrency(this.oldPrice!);

  String _convertToBrazilianCurrency(double value) {
    List<String> splittedNumber = value.toString().split(".");
    return "${splittedNumber[0]},${splittedNumber[1].padRight(2, "0")}";
  }
}