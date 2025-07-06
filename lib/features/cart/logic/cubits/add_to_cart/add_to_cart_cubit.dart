import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/cart/logic/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.cartRepo) : super(AddToCartInitial());
  final CartRepo cartRepo;

  Future<void> addToCart({required ProductModel productModel}) async {
    final res = await cartRepo.getCartProducts();
    res.fold((l) => emit(AddToCartFailure(errorMessage: l.errorMessage)), (
      r,
    ) async {
      if (r.where((e) => e.productId == productModel.productId).isEmpty) {
        try {
          await cartRepo.addToCart(productModel: productModel);
          emit(AddToCartSuccess());
        } catch (e) {
          emit(AddToCartFailure(errorMessage: e.toString()));
        }
      } else {
        emit(ProductAlreadyInCart());
      }
    });
  }
}
