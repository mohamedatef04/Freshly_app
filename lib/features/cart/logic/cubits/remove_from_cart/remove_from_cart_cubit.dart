import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/cart/logic/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this.cartRepo) : super(RemoveFromCartInitial());
  final CartRepo cartRepo;

  Future<void> removeFromCart({required ProductModel productModel}) async {
    try {
      await cartRepo.removeFromCart(productModel: productModel);
      emit(RemoveFromCartSuccess());
    } catch (e) {
      emit(RemoveFromCartFailure(errorMessage: e.toString()));
    }
  }
}
