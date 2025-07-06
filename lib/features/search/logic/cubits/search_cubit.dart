import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/search/logic/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getSearchProducts() async {
    emit(SearchProductsLoading());
    final response = await searchRepo.getSearchProducts();
    response.fold(
      (l) => emit(SearchProductsError(errorMessage: l.errorMessage)),
      (r) {
        emit(SearchProductsLoaded(products: r));
      },
    );
  }

  Future<void> getSearchProductsByQuery({required String query}) async {
    emit(SearchProductsLoading());

    final response = await searchRepo.getSearchProducts();
    response.fold(
      (l) => emit(SearchProductsError(errorMessage: l.errorMessage)),
      (r) {
        List<ProductModel> searchItems = [];
        for (var element in r) {
          if (element.name!.toLowerCase().contains(query.toLowerCase())) {
            searchItems.add(element);
          } else {
            searchItems.remove(element);
          }
          if (searchItems.isNotEmpty) {
            emit(SearchProductsLoadedSearchItems(searchItems: searchItems));
          } else {
            emit(SearchProductsNotFound());
          }
        }
      },
    );
  }
}
