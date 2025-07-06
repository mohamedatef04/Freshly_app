import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/explore/logic/repos/explore_repo.dart';

class ExploreRepoImpl implements ExploreRepo {
  final ApiService apiService;

  ExploreRepoImpl({required this.apiService});
  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      final res = await apiService.get(
        endPoint: customEndPointForAllProductsWithCartAndFavourites,
      );
      List<dynamic> jsonData = res.data;
      List<ProductModel> allProducts = [];
      for (var product in jsonData) {
        allProducts.add(ProductModel.fromJson(product));
      }
      return right(allProducts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
