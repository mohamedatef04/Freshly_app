import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/cart/data/models/order_model.dart';
import 'package:freshly_app/features/cart/logic/repos/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.checkoutRepo) : super(OrderDetailsInitial());
  final CheckoutRepo checkoutRepo;

  Future<void> placeOrder({required OrderModel orderModel}) async {
    try {
      await checkoutRepo.placeOrder(orderModel: orderModel);
      emit(OrderDetailsAdded());
    } on Exception catch (e) {
      emit(OrderDetailsError(errormessage: e.toString()));
    }
  }
}
