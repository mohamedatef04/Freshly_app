import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/my%20orders/logic/repos/my_order_repo.dart';
import 'package:meta/meta.dart';

part 'get_my_orders_state.dart';

class GetMyOrdersCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersCubit(this.myOrderRepo) : super(GetMyOrdersInitial());

  final MyOrderRepo myOrderRepo;

  Future<void> getMyOrders() async {
    emit(GetMyOrdersLoading());
    final res = await myOrderRepo.getMyOrders();
    res.fold((l) => emit(GetMyOrdersFailure(errorMessage: l.errorMessage)), (
      r,
    ) {
      if (r.isNotEmpty) {
        emit(GetMyOrdersSuccess(myOrders: r));
      } else {
        emit(MyOrdersIsEmpty());
      }
    });
  }
}
