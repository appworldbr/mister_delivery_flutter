import 'package:flutter/material.dart';

class MisterDeliveryBottomNavigationBar extends StatelessWidget {
  const MisterDeliveryBottomNavigationBar({
    Key? key,
    this.activeIndex = 2,
  }) : super(key: key);

  final activeIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Ink(
                decoration: ShapeDecoration(
                  color: this.activeIndex == 0
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.account_circle_rounded),
                  onPressed: () {}, //TODO ACTION
                  color: this.activeIndex == 0
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Ink(
                decoration: ShapeDecoration(
                  color: this.activeIndex == 1
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {}, //TODO ACTION
                  color: this.activeIndex == 1
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Ink(
                decoration: ShapeDecoration(
                  color: this.activeIndex == 2
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {}, //TODO ACTION
                  color: this.activeIndex == 2
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Ink(
                decoration: ShapeDecoration(
                  color: this.activeIndex == 3
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.fastfood),
                  onPressed: () {}, //TODO ACTION
                  color: this.activeIndex == 3
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: Ink(
                decoration: ShapeDecoration(
                  color: this.activeIndex == 4
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {}, //TODO ACTION
                  color: this.activeIndex == 4
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
