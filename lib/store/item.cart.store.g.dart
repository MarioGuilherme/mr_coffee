// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.cart.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemCartStore on _ItemCartStore, Store {
  Computed<String>? _$totalPriceFormattedComputed;

  @override
  String get totalPriceFormatted => (_$totalPriceFormattedComputed ??=
          Computed<String>(() => super.totalPriceFormatted,
              name: '_ItemCartStore.totalPriceFormatted'))
      .value;

  late final _$quantityAtom =
      Atom(name: '_ItemCartStore.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$totalPriceAtom =
      Atom(name: '_ItemCartStore.totalPrice', context: context);

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  late final _$_ItemCartStoreActionController =
      ActionController(name: '_ItemCartStore', context: context);

  @override
  void inc(double price) {
    final _$actionInfo = _$_ItemCartStoreActionController.startAction(
        name: '_ItemCartStore.inc');
    try {
      return super.inc(price);
    } finally {
      _$_ItemCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dec(double price) {
    final _$actionInfo = _$_ItemCartStoreActionController.startAction(
        name: '_ItemCartStore.dec');
    try {
      return super.dec(price);
    } finally {
      _$_ItemCartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
totalPrice: ${totalPrice},
totalPriceFormatted: ${totalPriceFormatted}
    ''';
  }
}
