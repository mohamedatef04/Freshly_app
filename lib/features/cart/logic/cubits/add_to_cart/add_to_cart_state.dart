part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {}

class ProductAlreadyInCart extends AddToCartState {}

class AddToCartFailure extends AddToCartState {
  final String errorMessage;
  AddToCartFailure({required this.errorMessage});
}
