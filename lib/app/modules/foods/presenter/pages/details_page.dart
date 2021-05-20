import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/extra_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/details_store.dart';

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
  Widget _buildFutureBuilderError() {
    return Center(
      child: Text("Erro interno"),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _foodImage(imageUrl) {
    return Container(
      width: double.infinity,
      height: 250,
      child: FittedBox(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.cover,
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }

  Widget _foodInfo(name, price, description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                price,
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
              Text(description)
            ],
          )
        ],
      ),
    );
  }

  Widget _additions(List<ExtraEntity> extras) {
    if (extras.isEmpty) {
      return Text("Não há extra");
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          _additionTitle(),
          Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: extras.length,
                itemBuilder: (context, index) {
                  return _additionCard(extras[index]);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _additionTitle() {
    return Padding(
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
    );
  }

  Widget _additionCard(ExtraEntity extra) {
    Widget _selector;
    if (extra.limit > 1) {
      _selector = Text('counter');
    } else {
      _selector = Checkbox(
        onChanged: (bool? value) {},
        value: true,
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

  Widget _buildDetails(DetailsStoreState details) {
    final food = details.food!;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _foodImage(food.imageUrl),
          _foodInfo(food.name, food.priceFormatted, food.description),
          Divider(),
          _additions(food.extras),
          Divider(),
          _observationArea(),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(context) {
    return BottomAppBar(
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
      body: FutureBuilder(
        future: store.fetchTheFoodDetails(int.parse(widget.id)),
        builder: (context, snapshop) {
          if (snapshop.connectionState == ConnectionState.done) {
            if (snapshop.hasError) {
              return _buildFutureBuilderError();
            }
            return _buildDetails(store.state);
          }
          return _buildLoading();
        },
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}
