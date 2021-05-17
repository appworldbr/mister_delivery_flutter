import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/splash/presenter/splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends ModularState<SplashPage, SplashStore> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => store.getConfig(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
    );
  }
}
