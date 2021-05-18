import 'package:intl/intl.dart';

class BasicFoodEntity {
  final int id;
  final String imageUrl;
  final String name;
  final num price;
  final String description;
  final bool hasDetails;

  BasicFoodEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.hasDetails,
  });

  String get priceFormatted {
    final priceBrazilFormat =
        NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return priceBrazilFormat.format(price);
  }
}
