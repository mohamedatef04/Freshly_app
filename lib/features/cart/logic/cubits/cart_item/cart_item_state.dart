part of 'cart_item_cubit.dart';

@immutable
abstract class CartItemState {}

class CartItemInitial extends CartItemState {}

class CartItemUpdated extends CartItemState {
  final ProductModel productModel;
  CartItemUpdated({required this.productModel});
}
