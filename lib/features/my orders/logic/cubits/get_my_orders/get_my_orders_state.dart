part of 'get_my_orders_cubit.dart';

@immutable
abstract class GetMyOrdersState {}

class GetMyOrdersInitial extends GetMyOrdersState {}

class GetMyOrdersLoading extends GetMyOrdersState {}

class MyOrdersIsEmpty extends GetMyOrdersState {}

class GetMyOrdersSuccess extends GetMyOrdersState {
  final List<ProductModel> myOrders;

  GetMyOrdersSuccess({required this.myOrders});
}

class GetMyOrdersFailure extends GetMyOrdersState {
  final String errorMessage;

  GetMyOrdersFailure({required this.errorMessage});
}
