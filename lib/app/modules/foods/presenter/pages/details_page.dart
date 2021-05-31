import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_entity.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/extra_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/extra_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/details_store.dart';
import 'package:mister_delivery_flutter/app/shared/components/mister_delivery_counter.dart';

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
  // Widget _buildFutureBuilderError() {
  //   return Center(
  //     child: Text("Erro interno"),
  //   );
  // }

  // Widget _buildLoading() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }

  // Widget _buildList(List<CartExtraEntity> state) {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: state.length,
  //       itemBuilder: (_, index) {
  //         final extra = store.state.food.extras
  //             .firstWhere((_e) => _e.id == state[index].id);
  //         return _additionCard(extra, state[index].quantity);
  //       });
  // }

  // Widget _foodImage(imageUrl) {
  //   return Container(
  //     width: double.infinity,
  //     height: 250,
  //     child: FittedBox(
  //       clipBehavior: Clip.hardEdge,
  //       alignment: Alignment.bottomCenter,
  //       fit: BoxFit.cover,
  //       child: Image.network(
  //         imageUrl,
  //       ),
  //     ),
  //   );
  // }

  // Widget _foodInfo(name, price, description) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 10),
  //               child: Text(
  //                 name,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ),
  //             Text(
  //               price,
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Descrição:",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             Text(description)
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _observationArea() {
  //   return Card(
  //     margin: EdgeInsets.all(20),
  //     child: Padding(
  //       padding: EdgeInsets.all(8),
  //       child: TextField(
  //         maxLines: 8,
  //         decoration: InputDecoration.collapsed(
  //           hintText: "Observações",
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDetails() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _additions(),
          // _foodImage(food.imageUrl),
          // _foodInfo(food.name, food.priceFormatted, food.description),
          // Divider(),
          // ScopedBuilder(
          //   store: store.extraStore,
          //   onError: (context, error) => Text('a'),
          //   onLoading: (context) => CircularProgressIndicator(),
          //   onState: (context, state) => _additions(),
          // ),
          // Divider(),
          // _observationArea(),
        ],
      ),
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
                Text("+ ${extra.priceFormatted}"),
              ],
            ),
            _selector,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        onError: (context, error) => Text('err'),
        onLoading: (context) => Text('loa'),
        onState: (context, FoodEntity state) {
          if (state.id == 0) {
            store.fetchTheFoodDetails(int.parse(widget.id));
          }
          return _buildDetails();
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
                    //TODO
                    // Container(
                    //   transform: Matrix4.translationValues(13, 0, 0),
                    //   child: MDCounter(),
                    // ),
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
                          Text(
                            "R\$ 20,00",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
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
