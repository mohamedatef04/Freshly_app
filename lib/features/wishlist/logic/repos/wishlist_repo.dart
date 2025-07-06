import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class WishlistRepo {
  Future<Either<Failures, List<ProductModel>>> getWishListProducts();
  Future<Either<Failures, void>> addToWishList({
    required ProductModel productModel,
  });

  Future<Either<Failures, void>> removeFromWishList({
    required ProductModel productModel,
  });
}
