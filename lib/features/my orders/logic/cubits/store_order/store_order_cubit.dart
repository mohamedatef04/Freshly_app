import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/my%20orders/logic/repos/my_order_repo.dart';
import 'package:meta/meta.dart';

part 'store_order_state.dart';

class StoreOrderCubit extends Cubit<StoreOrderState> {
  StoreOrderCubit(this.myOrderRepo) : super(StoreOrderInitial());
  final MyOrderRepo myOrderRepo;

  Future<void> storeOrder({required ProductModel productModel}) async {
    try {
      await myOrderRepo.storeOrder(productModel: productModel);
      emit(StoreOrderSuccess());
    } on Exception catch (e) {
      emit(StoreOrderFailure(message: e.toString()));
    }
  }
}
