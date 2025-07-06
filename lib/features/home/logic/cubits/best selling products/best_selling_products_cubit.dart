import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/home/logic/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'best_selling_products_state.dart';

class BestSellingProductsCubit extends Cubit<BestSellingProductsState> {
  BestSellingProductsCubit(this.homeRepo) : super(BestSellingProductsInitial());

  final HomeRepo homeRepo;

  Future<void> getBestSellingProducts() async {
    emit(BestSellingProductsLoading());
    final response = await homeRepo.getBestSellingProducts();
    response.fold(
      (l) => emit(BestSellingProductsError(errorMessage: l.errorMessage)),
      (r) => emit(BestSellingProductsLoaded(bestSellingProducts: r)),
    );
  }
}
