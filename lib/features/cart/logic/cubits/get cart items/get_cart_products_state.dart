part of 'get_cart_products_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartProductsLoading extends CartState {}

class CartProductsIsEmpty extends CartState {}

class CartProductsLoaded extends CartState {
  final List<ProductModel> cartProducts;
  CartProductsLoaded({required this.cartProducts});
}

class CartProductsError extends CartState {
  final String errorMessage;
  CartProductsError({required this.errorMessage});
}

class CartProductsRemoved extends CartState {}

class CartProductsAfterRemove extends CartState {
  final List<ProductModel> cartProducts;
  CartProductsAfterRemove({required this.cartProducts});
}
