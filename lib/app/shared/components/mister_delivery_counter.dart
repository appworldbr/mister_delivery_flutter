import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MisterDeliveryCounter extends StatelessWidget {
  final int number;
  final VoidCallback addButtonPressed;
  final VoidCallback subtractButtonPressed;
  const MisterDeliveryCounter({
    Key? key,
    required this.number,
    required this.addButtonPressed,
    required this.subtractButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: subtractButtonPressed,
          color: Theme.of(context).primaryColor,
        ),
        Text(number.toString()),
        IconButton(
          icon: Icon(Icons.add_circle),
          onPressed: addButtonPressed,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
