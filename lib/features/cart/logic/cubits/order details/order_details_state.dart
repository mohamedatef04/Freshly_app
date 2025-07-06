part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsAdded extends OrderDetailsState {}

class OrderDetailsError extends OrderDetailsState {
  final String errormessage;
  OrderDetailsError({required this.errormessage});
}
