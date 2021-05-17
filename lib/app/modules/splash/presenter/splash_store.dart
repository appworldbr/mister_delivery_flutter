import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/usecases/get_config_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart';
import 'package:mister_delivery_flutter/app/modules/theme/theme_switcher.dart';

class SplashStore extends NotifierStore<Exception, bool> {
  final GetConfigUsecase usecase;

  SplashStore(this.usecase) : super(false);

  getConfig(context) async {
    setLoading(true);
    final result = await usecase();
    result.fold((l) => null, (r) {
      ThemeSwitcher.of(context)
          .switchTheme(ThemeData(primarySwatch: Modular.get<ConfigSingleton>().getColor()));
    });
    setLoading(false);
  }
}
