import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());
  final WishlistRepo wishlistRepo;

  Future<void> getWishListProducts() async {
    emit(WishlistProductsLoading());
    final res = await wishlistRepo.getWishListProducts();

    res.fold(
      (l) {
        emit(WishlistProductsError(errorMessage: l.errorMessage));
      },
      (r) {
        if (r.isNotEmpty) {
          emit(WishlistProductsLoaded(wishlistProducts: r));
        } else {
          emit(WishlistProductsEmpty());
        }
      },
    );
  }

  Future<void> removeFromWishList({required ProductModel productModel}) async {
    final res = await wishlistRepo.removeFromWishList(
      productModel: productModel,
    );

    res.fold(
      (l) {
        emit(WishlistProductsRemoveFailure(errorMessage: l.errorMessage));
      },
      (r) async {
        emit(WishlistProductsRemoveSuccess());
        final res = await wishlistRepo.getWishListProducts();
        res.fold(
          (l) {
            emit(WishlistProductsError(errorMessage: l.errorMessage));
          },
          (r) {
            if (r.isNotEmpty) {
              emit(WishlistProductsAfterRemove(wishlistProducts: r));
            } else {
              emit(WishlistProductsEmpty());
            }
          },
        );
      },
    );
  }
}
