import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/wishlist/logic/repos/wishlist_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_wishlist_state.dart';

class AddToWishlistCubit extends Cubit<AddToWishlistState> {
  AddToWishlistCubit(this.wishlistRepo) : super(AddToWishlistInitial());
  final WishlistRepo wishlistRepo;

  Future<void> addToWishlist({required ProductModel productModel}) async {
    final res = await wishlistRepo.getWishListProducts();

    res.fold((l) => emit(AddToWishlistFailure(errorMessage: l.errorMessage)), (
      r,
    ) async {
      if (r.where((e) => e.productId == productModel.productId).isEmpty) {
        await wishlistRepo.addToWishList(productModel: productModel);
        emit(AddToWishlistSuccess());
      } else {
        await wishlistRepo.removeFromWishList(productModel: productModel);
        emit(ProductRemoved());
      }
    });
  }
}
