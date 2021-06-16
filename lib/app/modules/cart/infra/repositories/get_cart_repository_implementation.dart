import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/repositories/get_cart_repository.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/datasource/get_cart_datasource.dart';

class GetCartRepositoryImplementation extends IGetCartRepository {
  IGetCartDatasource datasource;

  GetCartRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureCart, List<CartFoodResponseEntity>>> getCart() async {
    try {
      final result = await datasource.getCart();
      return Right(result);
    } catch (e) {
      return Left(FailureCartDatasource());
    }
  }
}
