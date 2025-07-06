import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WishlistRepoImpl implements WishlistRepo {
  final ApiService apiService;
  WishlistRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<ProductModel>>> getWishListProducts() async {
    try {
      final res = await apiService.get(
        endPoint: customEndPointForAllProductsWithCartAndFavourites,
      );
      List<dynamic> jsondata = res.data;
      List<ProductModel> allWishlistProducts = [];
      List<ProductModel> wishlistProductsForSpecificUser = [];

      for (var product in jsondata) {
        allWishlistProducts.add(ProductModel.fromJson(product));
      }
      for (var product in allWishlistProducts) {
        if (product.wishlistProducts!.isNotEmpty &&
            product.wishlistProducts!.where((element) {
              return element['for_user'] ==
                  Supabase.instance.client.auth.currentUser!.id;
            }).isNotEmpty) {
          wishlistProductsForSpecificUser.add(product);
        } else {
          wishlistProductsForSpecificUser.remove(product);
        }
      }
      return right(wishlistProductsForSpecificUser);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> addToWishList({
    required ProductModel productModel,
  }) async {
    try {
      await apiService.post(
        endPoint: wishlistProductsEndPoint,
        data: {
          'is_wishlist': true,
          'for_user': Supabase.instance.client.auth.currentUser!.id,
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
  Future<Either<Failures, void>> removeFromWishList({
    required ProductModel productModel,
  }) async {
    try {
      await apiService.delete(
        endPoint:
            '$wishlistProductsEndPoint?for_product=eq.${productModel.productId}&for_user=eq.${Supabase.instance.client.auth.currentUser!.id}',
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
