part of 'category_products_cubit.dart';

@immutable
abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsLoaded extends CategoryProductsState {
  final List<ProductModel> categoryProducts;
  CategoryProductsLoaded({required this.categoryProducts});
}

class CategoryProductsError extends CategoryProductsState {
  final String errorMessage;
  CategoryProductsError({required this.errorMessage});
}
