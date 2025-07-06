part of 'add_to_wishlist_cubit.dart';

@immutable
abstract class AddToWishlistState {}

class AddToWishlistInitial extends AddToWishlistState {}

class AddToWishlistSuccess extends AddToWishlistState {}

class ProductRemoved extends AddToWishlistState {}

class AddToWishlistFailure extends AddToWishlistState {
  final String errorMessage;
  AddToWishlistFailure({required this.errorMessage});
}
