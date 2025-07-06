import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/cart/logic/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'get_cart_products_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;

  List<ProductModel>? cartProducts;

  bool isEmpty = false;

  Future<void> getCartProducts() async {
    emit(CartProductsLoading());
    final res = await cartRepo.getCartProducts();
    res.fold((l) => emit(CartProductsError(errorMessage: l.errorMessage)), (r) {
      if (r.isNotEmpty) {
        cartProducts = r;
        isEmpty = false;
        emit(CartProductsLoaded(cartProducts: r));
      } else {
        isEmpty = true;
        emit(CartProductsIsEmpty());
      }
    });
  }

  Future<void> removeFromCart({required ProductModel productModel}) async {
    try {
      await cartRepo.removeFromCart(productModel: productModel);
      emit(CartProductsRemoved());
      final res = await cartRepo.getCartProducts();
      res.fold((l) => emit(CartProductsError(errorMessage: l.errorMessage)), (
        r,
      ) {
        if (r.isNotEmpty) {
          cartProducts = r;
          isEmpty = false;
          emit(CartProductsAfterRemove(cartProducts: r));
        } else {
          isEmpty = true;
          emit(CartProductsIsEmpty());
        }
      });
    } catch (e) {
      emit(CartProductsError(errorMessage: e.toString()));
    }
  }

  calculateTotalPrice() {
    double totalPrice = 0;
    for (var element in cartProducts ?? []) {
      totalPrice = totalPrice + element.calculatePrice();
    }

    return totalPrice;
  }
}
