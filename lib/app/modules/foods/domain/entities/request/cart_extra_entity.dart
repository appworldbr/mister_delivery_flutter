class CartExtraEntity {
  final int id;
  final int quantity;

  CartExtraEntity({
    required this.id,
    required this.quantity,
  });

  copyWith({int? id, int? quantity}) {
    return CartExtraEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }
}
