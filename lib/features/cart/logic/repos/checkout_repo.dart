import 'package:freshly_app/features/cart/data/models/order_model.dart';

abstract class CheckoutRepo {
  Future<void> placeOrder({required OrderModel orderModel});
}
