import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/login/domain/entities/request/user_login_entity.dart';

class UserLoginModel extends UserLoginEntity {
  UserLoginModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source));
}
