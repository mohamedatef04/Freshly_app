part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchProductsLoading extends SearchState {}

class SearchProductsLoaded extends SearchState {
  final List<ProductModel> products;
  SearchProductsLoaded({required this.products});
}

class SearchProductsLoadedSearchItems extends SearchState {
  final List<ProductModel> searchItems;
  SearchProductsLoadedSearchItems({required this.searchItems});
}

class SearchProductsError extends SearchState {
  final String errorMessage;
  SearchProductsError({required this.errorMessage});
}

class SearchProductsNotFound extends SearchState {}
