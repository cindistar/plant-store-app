class ItemQuantity {
  ItemQuantity.fromMap(Map<String, dynamic> map) {
    price = map['price'] as num;
    stock = map['stock'] as int;
  }

  num price;
  int stock;

  bool get hasStock => stock > 0;
  

  @override
  String toString() => 'ItemQuantity(price: $price, stock: $stock)';
}
