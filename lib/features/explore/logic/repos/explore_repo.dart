import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class ExploreRepo {
  Future<Either<Failures, List<ProductModel>>> getAllProducts();
}
