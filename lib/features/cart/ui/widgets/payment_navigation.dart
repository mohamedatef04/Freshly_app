import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/cart/data/models/order_model.dart';
import 'package:freshly_app/features/cart/logic/cubits/empty_cart_after_order/empty_cart_after_order_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/order%20details/order_details_cubit.dart';
import 'package:freshly_app/features/my%20orders/logic/cubits/store_order/store_order_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

void paymentNavigation(
  BuildContext context,
  TextEditingController fullNameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  TextEditingController addressController,
  TextEditingController cityController,
  List<ProductModel> cartProducts,
  double price,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => PaymentView(
            onPaymentSuccess: () {
              context.read<OrderDetailsCubit>().placeOrder(
                orderModel: OrderModel(
                  fullName: fullNameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  address: addressController.text,
                  city: cityController.text,
                  productName: cartProducts
                      .map((e) => e.name)
                      .toList()
                      .join(' , '),
                  productAmount: cartProducts
                      .map((e) => e.quantity)
                      .toList()
                      .join(' , '),
                ),
              );
              context
                  .read<EmptyCartAfterOrderCubit>()
                  .emptyCartAfterPacingOrder();
              for (var element in cartProducts) {
                context.read<StoreOrderCubit>().storeOrder(
                  productModel: element,
                );
              }

              Future.delayed(const Duration(seconds: 1), () {
                context.pop();
                context.pop();
                context.pop();
              });
            },
            onPaymentError: () {
              // Handle payment failure
            },
            price: price, // Required: Total price (e.g., 100 for 100 EGP)
          ),
    ),
  );
}
