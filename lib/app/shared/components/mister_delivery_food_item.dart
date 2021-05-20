import 'package:flutter/material.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/basic_food_entity.dart';

class MisterDeliveryFoodItem extends StatelessWidget {
  final BasicFoodEntity food;
  final VoidCallback onPressed;

  const MisterDeliveryFoodItem({
    Key? key,
    required this.food,
    required this.onPressed,
  }) : super(key: key);

  Widget _priceAndCounter() {
    List<Widget> _row = [
      Text(
        food.priceFormatted,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )
    ];

    // if (this.showCounter) {
    //   _row.add(MDCounter());
    // }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _row,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  food.imageUrl,
                  height: 136,
                  width: 136,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            food.description,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                      _priceAndCounter(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
