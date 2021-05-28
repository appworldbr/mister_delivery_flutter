import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/search_store.dart';
import 'package:mister_delivery_flutter/app/shared/components/mister_delivery_bottom_navigation_bar.dart';
import 'package:mister_delivery_flutter/app/shared/components/mister_delivery_food_item.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  Widget _buildList(List<BasicFoodEntity> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, id) {
        final item = list[id];
        return MisterDeliveryFoodItem(
          food: item,
          onPressed: () => Modular.to.pushNamed('${item.id}'),
        );
      },
    );
  }

  Widget _buildError(FailureFood? error) {
    if (error is FailureFoodSearch) {
      return Center(
        child: Text("Erro ao realizar a busca"),
      );
    }
    return Center(
      child: Text("Erro interno"),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Pesquisa...'),
              onChanged: store.getListByName,
            ),
          ),
          Expanded(
            child:
                ScopedBuilder<SearchStore, FailureFood, List<BasicFoodEntity>>(
              store: store,
              onError: (context, error) => _buildError(error),
              onLoading: (context) =>
                  Center(child: CircularProgressIndicator()),
              onState: (context, state) => _buildList(state),
            ),
          )
        ],
      ),
      bottomNavigationBar: MisterDeliveryBottomNavigationBar(),
    );
  }
}
