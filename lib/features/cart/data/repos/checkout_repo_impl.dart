import 'package:dio/dio.dart';
import 'package:freshly_app/core/errors/failures.dart';
import 'package:freshly_app/core/network/api_constants.dart';
import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/features/cart/data/models/order_model.dart';
import 'package:freshly_app/features/cart/logic/repos/checkout_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final ApiService apiService;

  CheckoutRepoImpl(this.apiService);
  @override
  Future<void> placeOrder({required OrderModel orderModel}) async {
    try {
      await apiService.post(
        endPoint: orderEndPoint,
        data: {
          'full_name': orderModel.fullName,
          'email': orderModel.email,
          'phone': orderModel.phone,
          'address': orderModel.address,
          'city': orderModel.city,
          'order_name': orderModel.productName,
          'order_quantity': orderModel.productAmount,
          'user_id': Supabase.instance.client.auth.currentUser!.id,
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
}
