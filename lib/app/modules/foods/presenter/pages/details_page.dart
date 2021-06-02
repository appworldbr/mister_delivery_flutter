import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/extra_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/extra_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/details_store.dart';
import 'package:mister_delivery_flutter/app/shared/components/mister_delivery_counter.dart';
import 'package:mister_delivery_flutter/app/shared/helpers.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsStore> {
  Widget _buildError() {
    return Center(
      child: Text("Erro interno"),
    );
  }

  Widget _buildDetails(FoodEntity food) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _foodImage(food.imageUrl),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        food.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      formatPrice(food.price),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descrição:",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(food.description)
                  ],
                )
              ],
            ),
          ),
          Divider(),
          _additions(),
          _observationArea(),
        ],
      ),
    );
  }

  Widget _foodImage(String imageUrl) {
    Widget child;

    child = imageUrl.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : FittedBox(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
            child: Image.network(imageUrl),
          );

    return Container(
      width: double.infinity,
      height: 250,
      child: child,
    );
  }

  Widget _additions() {
    if (store.state.extras.isEmpty) {
      return Text("Não há extra");
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Icon(Icons.add_circle_outline),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adicionais",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        "Selecione seus adicionais",
                        style: TextStyle(
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: store.state.extras.length,
            itemBuilder: (context, index) {
              return _additionCard(store.state.extras[index]);
            },
          )
        ],
      ),
    );
  }

  Widget _additionCard(ExtraEntity extra) {
    Widget _selector;

    if (extra.limit > 1) {
      _selector = ScopedBuilder(
        store: store.extraStore,
        onState: (context, state) {
          final quantity = store.extraStore.state
              .firstWhere((e) => e.id == extra.id)
              .quantity;
          return MisterDeliveryCounter(
            number: quantity,
            addButtonPressed: () => store.extraStore.incrementQuantity(extra),
            subtractButtonPressed: () =>
                store.extraStore.decrementQuantity(extra),
          );
        },
      );
    } else {
      _selector = ScopedBuilder(
        store: store.extraStore,
        onState: (context, state) {
          final quantity = store.extraStore.state
              .firstWhere((e) => e.id == extra.id)
              .quantity;
          return Checkbox(
            value: quantity == 1,
            onChanged: (bool? value) =>
                store.extraStore.toggleExtra(value, extra),
          );
        },
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  extra.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text("+ ${formatPrice(extra.price)}"),
              ],
            ),
            _selector,
          ],
        ),
      ),
    );
  }

  Widget _observationArea() {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextField(
          maxLines: 8,
          decoration: InputDecoration.collapsed(
            hintText: "Observações",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    store.cartStore.selectState.addListener(() {
      store.updatePrice();
    });

    store.extraStore.selectState.addListener(() {
      store.updatePrice();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Mister Delivery"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: ScopedBuilder(
        store: store,
        onError: (context, error) => _buildError(),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
        onState: (context, FoodEntity state) {
          if (state.id == 0) {
            store.fetchTheFoodDetails(int.parse(widget.id));
          }
          return _buildDetails(state);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantidade:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(13, 0, 0),
                      child: ScopedBuilder(
                        store: store.cartStore,
                        onState: (_, CartFoodEntity state) =>
                            MisterDeliveryCounter(
                          number: state.quantity,
                          addButtonPressed: () =>
                              store.cartStore.incrementQuantity(),
                          subtractButtonPressed: () =>
                              store.cartStore.decrementQuantity(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 38,
                      height: 38,
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          color: Colors.red,
                          icon: Icon(
                            Icons.favorite,
                            size: 17,
                          ),
                          onPressed: () {}, //TODO ACTION
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Adicionar no carrinho",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ScopedBuilder(
                            store: store.priceStore,
                            onState: (_, num state) => Text(
                              formatPrice(state),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () {}, //TODO ACTION
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
