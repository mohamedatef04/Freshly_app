import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/home/logic/repos/home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl({required this.apiService});
  @override
  @override
  Future<Either<Failures, List<ProductModel>>> getBestSellingProducts() async {
    try {
      final res = await apiService.get(
        endPoint: customEndPointForAllProductsWithCartAndFavourites,
      );
      List<dynamic> jsonData = res.data;
      List<ProductModel> allProducts = [];
      List<ProductModel> bestSellingProducts = [];
      for (var product in jsonData) {
        allProducts.add(ProductModel.fromJson(product));
      }
      for (var product in allProducts) {
        if (product.isBestSelling == true) {
          bestSellingProducts.add(product);
        } else {
          bestSellingProducts.remove(product);
        }
      }
      return right(bestSellingProducts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<ProductModel>>> getCategoryProducts({
    required String category,
  }) async {
    try {
      final res = await apiService.get(
        endPoint: customEndPointForAllProductsWithCartAndFavourites,
      );
      List<dynamic> jsonData = res.data;
      List<ProductModel> allProducts = [];
      List<ProductModel> categoryProducts = [];
      for (var product in jsonData) {
        allProducts.add(ProductModel.fromJson(product));
      }
      for (var product in allProducts) {
        if (product.category == category) {
          categoryProducts.add(product);
        } else {
          categoryProducts.remove(product);
        }
      }
      return right(categoryProducts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> addProductRate({
    required double rate,
    required ProductModel productModel,
  }) async {
    try {
      await apiService.post(
        endPoint: ratingEndPoint,
        data: {
          'rate_value': rate,
          'for_user': Supabase.instance.client.auth.currentUser!.id,
          'for_product': productModel.productId,
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<void> updateProductRate({
    required double rate,
    required ProductModel productModel,
  }) async {
    try {
      await apiService.update(
        endPoint:
            '$ratingEndPoint?for_user=eq.${Supabase.instance.client.auth.currentUser!.id}&for_product=eq.${productModel.productId}',
        data: {'rate_value': rate},
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
