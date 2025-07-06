import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class MyOrderRepo {
  Future<void> storeOrder({required ProductModel productModel});

  Future<Either<Failures, List<ProductModel>>> getMyOrders();
}
