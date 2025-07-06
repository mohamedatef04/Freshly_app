import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts({
    required String category,
  });

  Future<Either<Failures, List<ProductModel>>> getBestSellingProducts();

  Future<void> addProductRate({
    required double rate,
    required ProductModel productModel,
  });

  Future<void> updateProductRate({
    required double rate,
    required ProductModel productModel,
  });
}
