import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/cart/logic/repos/cart_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepoImpl implements CartRepo {
  final ApiService apiService;
  final SupabaseClient supabase = Supabase.instance.client;
  CartRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<ProductModel>>> getCartProducts() async {
    try {
      final res = await apiService.get(endPoint: allCartProductsEndPoint);
      List<dynamic> jsonData = res.data;
      List<ProductModel> allProducts = [];
      List<ProductModel> cartProducts = [];

      for (var product in jsonData) {
        allProducts.add(ProductModel.fromJson(product));
      }
      for (var product in allProducts) {
        if (product.cartItems!.isNotEmpty &&
            product.cartItems!.where((element) {
              return element['for_user'] == supabase.auth.currentUser!.id;
            }).isNotEmpty) {
          cartProducts.add(product);
        } else {
          cartProducts.remove(product);
        }
      }

      return right(cartProducts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> addToCart({
    required ProductModel productModel,
  }) async {
    try {
      await apiService.post(
        endPoint: cartProductsEndPoint,
        data: {
          'is_incart': true,
          'for_user': supabase.auth.currentUser!.id,
          'for_product': productModel.productId,
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<Either<Failures, void>> removeFromCart({
    required ProductModel productModel,
  }) async {
    try {
      await apiService.delete(
        endPoint:
            '$cartProductsEndPoint?for_product=eq.${productModel.productId}&for_user=eq.${supabase.auth.currentUser!.id}',
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<Either<Failures, void>> emptyCartAfterPacingOrder() async {
    try {
      await apiService.delete(
        endPoint:
            '$cartProductsEndPoint?for_user=eq.${supabase.auth.currentUser!.id}',
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
