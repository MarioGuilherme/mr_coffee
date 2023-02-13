import "package:mobx/mobx.dart";

part "item.cart.store.g.dart";

class ItemCartStore = _ItemCartStore with _$ItemCartStore;

abstract class _ItemCartStore with Store {
  @observable
  int quantity = 1;

  @observable
  double totalPrice = 0.0;

  @action
  void inc(double price) {
    if (this.quantity != 15) {
      this.quantity++;
      this.totalPrice = price * this.quantity;
    }
  }

  @action
  void dec(double price) {
    if (this.quantity != 0) {
      this.quantity--;
      this.totalPrice = price * this.quantity;
    }
  }

  @computed
  String get totalPriceFormatted {
    List<String> splittedNumber = this.totalPrice.toStringAsFixed(2).split(".");
    return "${splittedNumber[0]},${splittedNumber[1].padRight(2, "0")}";
  }
}