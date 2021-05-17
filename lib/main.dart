import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/theme/theme_switcher.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() => runApp(
      ThemeSwitcherWidget(
        initialTheme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        child: ModularApp(
          module: AppModule(),
          child: AppWidget(),
        ),
      ),
    );
