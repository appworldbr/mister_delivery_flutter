import 'package:intl/intl.dart';

formatPrice(num price, {String locale: "pt_BR", String symbol: "R\$"}) {
  final priceFormat = NumberFormat.currency(locale: locale, symbol: symbol);
  return priceFormat.format(price);
}
