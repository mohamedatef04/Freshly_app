import 'package:dartz/dartz.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failures, List<ProductModel>>> getCartProducts();
  Future<Either<Failures, void>> addToCart({
    required ProductModel productModel,
  });

  Future<Either<Failures, void>> removeFromCart({
    required ProductModel productModel,
  });

  Future<Either<Failures, void>> emptyCartAfterPacingOrder();
}
