import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';

class LoginStoreState {
  bool obscurePassword;

  LoginStoreState({
    required this.obscurePassword,
  });
}

class LoginStore extends NotifierStore<FailureLogin, LoginStoreState> {
  final LoginWithEmailUsecase usecase;

  LoginStore(this.usecase) : super(LoginStoreState(obscurePassword: true));

  login(String email, String password) async {
    setLoading(true);
    final result = await usecase(UserLoginModel.fromMap({
      'email': email,
      'password': password,
    }));
    result.fold(setError, (r) => update(state));
    setLoading(false);
  }

  togglePassword() async {
    print('a');
    print('a');
    print('a');
    print('a');
    setLoading(true);
    await Future.delayed(Duration(seconds: 2));
    // update(loginStoreState.obscurePassword = !loginStoreState.obscurePassword);
    setLoading(false);
    print('a');
    print('a');
    print('a');
    print('a');
  }
}
