import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/theme/theme_switcher.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    const btns = [
      {'name': 'Login', 'url': '/login'},
      {'name': 'Splash', 'url': '/splash'},
      {'name': 'Foods', 'url': '/foods'}
    ];

    List<Widget> btnWidgets = [];

    for (var i = 0; i < btns.length; i++) {
      final btn = btns[i];
      btnWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            Modular.to.navigate(btn['url']!);
          },
          child: Text(btn['name']!),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: btnWidgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeSwitcher.of(context).switchTheme(ThemeData(
            primarySwatch: Colors.yellow,
          ));
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
