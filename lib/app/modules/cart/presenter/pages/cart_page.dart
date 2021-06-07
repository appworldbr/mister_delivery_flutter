import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  int? _character = 1;
  List<bool> _isOpen = [false, false, false, false];

  final numberFormatCurrency =
      NumberFormat.currency(locale: 'pt-BR', symbol: 'R\$');

  Widget _addressOptions() {
    return Column(
      children: <Widget>[
        RadioListTile<int>(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Casa',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rua: Leopoldina de Araujo, 862',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          value: 1,
          groupValue: _character,
          onChanged: (value) {
            setState(() {
              _character = value;
            });
          }, //add action
        ),
        RadioListTile<int>(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trabalho',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rua: Marcelo Galassi, 302',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          value: 2,
          groupValue: _character,
          onChanged: (value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }

  Widget _selectTheAddress(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Selecione o Endereço de Entrega:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _addressOptions(),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextButton(
              child: Text(
                "Adicionar Outro",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _products(context) {
    return ExpansionPanelList(
      children: [
        _productItem(
          context,
          _isOpen[0],
          'Lanche #1',
          15.2,
          [
            {
              "name": "Hamburger",
              "price": 2.2,
              "quantity": 5,
            },
            {
              "name": "Catupiry",
              "price": 2,
              "quantity": 1,
            },
          ],
          "Sem Cebola",
        ),
        _productItem(
          context,
          _isOpen[1],
          'Lanche #2',
          22.4,
          [
            {
              "name": "Catupiry",
              "price": 2,
              "quantity": 2,
            },
          ],
          "Sem Cebola e Carne Bem Passada",
        ),
        _productItem(
          context,
          _isOpen[2],
          'Pizza #1',
          25.5,
          [
            {
              "name": "Frango",
              "price": 12.5,
              "quantity": 1,
            },
          ],
          "Separar bem os Sabores",
        ),
        _productItem(
          context,
          _isOpen[3],
          'Bebida #1',
          6,
          [],
          '',
        ),
      ],
      expansionCallback: (i, isOpen) => {
        setState(
          () => _isOpen[i] = !isOpen,
        )
      },
    );
  }

  Widget _productItemExtras(List<Map<String, dynamic>> _extras) {
    if (_extras.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adicionais:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 36.0,
            ),
            child: ListView.builder(
              itemExtent: 25,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final _extra = _extras[index];
                return ListTile(
                  title: Text(
                      "${_extra['quantity']}x ${_extra['name']} (${numberFormatCurrency.format(_extra['price'] * _extra['quantity'])})"),
                );
              },
              itemCount: _extras.length,
            ),
          ),
        ],
      );
    }
    return Text("-- Não há adicionais --");
  }

  Widget _productItemObservation(String _observation) {
    if (_observation.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Observação:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(_observation),
        ],
      );
    }
    return Text("-- Não há observação --");
  }

  ExpansionPanel _productItem(
    BuildContext _context,
    bool _isOpen,
    String _name,
    double _price,
    List<Map<String, dynamic>> _extras,
    String _observation,
  ) {
    return ExpansionPanel(
      canTapOnHeader: true,
      headerBuilder: (context, isOpen) {
        return Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    numberFormatCurrency.format(_price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _productItemExtras(_extras),
                _productItemObservation(_observation)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                color: Theme.of(_context).primaryColor,
                onPressed: () {}, //TODO ACTION
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {}, //TODO ACTION
              ),
            ],
          )
        ],
      ),
      isExpanded: _isOpen,
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
                    "Subtotal:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    numberFormatCurrency.format(30.5),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Taxa de Entrega:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    numberFormatCurrency.format(6),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          "Confirmar Pedido",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          numberFormatCurrency.format(36.5),
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
        title: Text("Carrinho"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _products(context),
            Divider(),
            _selectTheAddress(context),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}
