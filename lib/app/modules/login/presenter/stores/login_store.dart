import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/usecases/login_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/modules/login/presenter/stores/password_obscure_store.dart';

class LoginStore extends NotifierStore<FailureLogin, bool> {
  final LoginWithEmailUsecase usecase;
  final PasswordObsctureStore passwordObscture;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginStore(this.usecase, this.passwordObscture) : super(false) {
    emailController.text = 'user@user.com';
    passwordController.text = 'password';
  }

  login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setLoading(true);
    final result = await usecase(UserLoginModel.fromMap({
      'email': emailController.text,
      'password': passwordController.text,
    }));
    result.fold(setError, (r) {
      Modular.to.pop();
    });
    setLoading(false);
  }

  backToHome() {
    Modular.to.navigate('/');
  }
}
