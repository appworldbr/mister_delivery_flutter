import 'package:intl/intl.dart';

import 'extra_entity.dart';

class FoodEntity {
  final int id;
  final String imageUrl;
  final String name;
  final num price;
  final String description;
  final bool hasDetails;
  final List<ExtraEntity> extras;

  FoodEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.hasDetails,
    required this.extras,
  });

  factory FoodEntity.empty() {
    return FoodEntity(
      id: 0,
      name: '',
      price: 0,
      imageUrl: '',
      hasDetails: false,
      extras: [],
      description: '',
    );
  }

  String get priceFormatted {
    final priceBrazilFormat =
        NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return priceBrazilFormat.format(price);
  }
}
