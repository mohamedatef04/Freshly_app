part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistProductsLoading extends WishlistState {}

class WishlistProductsLoaded extends WishlistState {
  final List<ProductModel> wishlistProducts;
  WishlistProductsLoaded({required this.wishlistProducts});
}

class WishlistProductsError extends WishlistState {
  final String errorMessage;
  WishlistProductsError({required this.errorMessage});
}

class WishlistProductsEmpty extends WishlistState {}

class WishlistProductsAfterRemove extends WishlistState {
  final List<ProductModel> wishlistProducts;
  WishlistProductsAfterRemove({required this.wishlistProducts});
}

class WishlistProductsRemoveFailure extends WishlistState {
  final String errorMessage;
  WishlistProductsRemoveFailure({required this.errorMessage});
}

class WishlistProductsRemoveSuccess extends WishlistState {}
