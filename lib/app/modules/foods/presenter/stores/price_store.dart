import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';

class PriceStore extends NotifierStore<FailureFood, num> {
  PriceStore() : super(0);
}
