import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/theme/theme_switcher.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeSwitcher.of(context).themeData,
      initialRoute: '/cart',
    ).modular();
  }
}
