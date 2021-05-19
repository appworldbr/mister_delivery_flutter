import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/extra_entity.dart';

class ExtraModel extends ExtraEntity {
  ExtraModel({
    required int id,
    required String name,
    required num price,
    required int limit,
  }) : super(
          id: id,
          name: name,
          price: price,
          limit: limit,
        );

  factory ExtraModel.fromMap(Map<String, dynamic> map) {
    return ExtraModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      limit: map['limit'],
    );
  }
}
