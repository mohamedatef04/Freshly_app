import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<ProductModel>>> getSearchProducts();
}
