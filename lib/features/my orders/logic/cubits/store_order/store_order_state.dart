part of 'store_order_cubit.dart';

@immutable
abstract class StoreOrderState {}

class StoreOrderInitial extends StoreOrderState {}

class StoreOrderSuccess extends StoreOrderState {}

class StoreOrderFailure extends StoreOrderState {
  final String message;
  StoreOrderFailure({required this.message});
}
