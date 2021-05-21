import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/login/domain/entities/response/token_entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({
    required String token,
  }) : super(token: token);

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));
}
