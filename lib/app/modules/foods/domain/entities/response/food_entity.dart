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
}
