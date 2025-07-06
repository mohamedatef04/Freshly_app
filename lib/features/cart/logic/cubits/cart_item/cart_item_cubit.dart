import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updataCartItem(ProductModel productModel) {
    emit(CartItemUpdated(productModel: productModel));
  }
}
