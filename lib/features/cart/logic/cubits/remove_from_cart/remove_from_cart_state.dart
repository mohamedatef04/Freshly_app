part of 'remove_from_cart_cubit.dart';

@immutable
abstract class RemoveFromCartState {}

class RemoveFromCartInitial extends RemoveFromCartState {}

class RemoveFromCartSuccess extends RemoveFromCartState {}

class CartProductsAfterRemove extends RemoveFromCartState {
  final List<ProductModel> cartProducts;
  CartProductsAfterRemove({required this.cartProducts});
}

class RemoveFromCartFailure extends RemoveFromCartState {
  final String errorMessage;
  RemoveFromCartFailure({required this.errorMessage});
}
