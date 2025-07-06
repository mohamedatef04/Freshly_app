part of 'empty_cart_after_order_cubit.dart';

@immutable
abstract class EmptyCartAfterOrderState {}

class EmptyCartAfterOrderInitial extends EmptyCartAfterOrderState {}

class EmptyCartAfterOrderSuccess extends EmptyCartAfterOrderState {}

class EmptyCartAfterOrderFailure extends EmptyCartAfterOrderState {
  final String errorMessage;

  EmptyCartAfterOrderFailure({required this.errorMessage});
}
