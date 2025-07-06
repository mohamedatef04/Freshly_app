import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/home/logic/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.homeRepo) : super(CategoryProductsInitial());

  final HomeRepo homeRepo;

  Future<void> getCategortProducts({required String category}) async {
    emit(CategoryProductsLoading());
    final response = await homeRepo.getCategoryProducts(category: category);
    response.fold(
      (l) => emit(CategoryProductsError(errorMessage: l.errorMessage)),
      (r) => emit(CategoryProductsLoaded(categoryProducts: r)),
    );
  }
}
