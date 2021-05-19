import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/extra_model.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    required int id,
    required String imageUrl,
    required String name,
    required num price,
    required String description,
    required bool hasDetails,
    required List<ExtraModel> extras,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          name: name,
          price: price,
          description: description,
          hasDetails: hasDetails,
          extras: extras,
        );

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      hasDetails: map['hasDetails'],
      extras: List<ExtraModel>.from(
          map['extras']?.map((x) => ExtraModel.fromMap(x))),
    );
  }
}
