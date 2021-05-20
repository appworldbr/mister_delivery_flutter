import 'package:intl/intl.dart';

class ExtraEntity {
  final int id;
  final String name;
  final num price;
  final int limit;

  ExtraEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.limit,
  });

  String get priceFormatted {
    final priceBrazilFormat =
        NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return priceBrazilFormat.format(price);
  }
}
