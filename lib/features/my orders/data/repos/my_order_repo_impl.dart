import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/my%20orders/logic/repos/my_order_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyOrderRepoImpl implements MyOrderRepo {
  final ApiService apiService;

  MyOrderRepoImpl({required this.apiService});
  @override
  Future<void> storeOrder({required ProductModel productModel}) async {
    try {
      await apiService.post(
        endPoint: purchasedProductsEndPoint,
        data: {
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
  Future<Either<Failures, List<ProductModel>>> getMyOrders() async {
    try {
      final res = await apiService.get(endPoint: allPurchasedProductsEndPoint);

      List<dynamic> jsonData = res.data;
      List<ProductModel> allPurcahasedProducts = [];
      List<ProductModel> allPurcahasedProductsForSpecificUser = [];

      for (var product in jsonData) {
        allPurcahasedProducts.add(ProductModel.fromJson(product));
      }
      for (var element in allPurcahasedProducts) {
        if (element.purchasedProducts!.isNotEmpty &&
            element.purchasedProducts!
                .where(
                  (element) =>
                      element['for_user'] ==
                      Supabase.instance.client.auth.currentUser!.id,
                )
                .isNotEmpty) {
          allPurcahasedProductsForSpecificUser.add(element);
        } else {
          allPurcahasedProductsForSpecificUser.remove(element);
        }
      }
      return right(allPurcahasedProductsForSpecificUser);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
