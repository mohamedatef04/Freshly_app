import 'package:bloc/bloc.dart';
import 'package:freshly_app/features/cart/logic/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'empty_cart_after_order_state.dart';

class EmptyCartAfterOrderCubit extends Cubit<EmptyCartAfterOrderState> {
  EmptyCartAfterOrderCubit(this.cartRepo) : super(EmptyCartAfterOrderInitial());
  final CartRepo cartRepo;

  Future<void> emptyCartAfterPacingOrder() async {
    final res = await cartRepo.emptyCartAfterPacingOrder();
    res.fold(
      (l) => emit(EmptyCartAfterOrderFailure(errorMessage: l.errorMessage)),
      (r) => emit(EmptyCartAfterOrderSuccess()),
    );
  }
}
