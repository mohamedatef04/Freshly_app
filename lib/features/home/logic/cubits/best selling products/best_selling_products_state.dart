part of 'best_selling_products_cubit.dart';

@immutable
abstract class BestSellingProductsState {}

class BestSellingProductsInitial extends BestSellingProductsState {}

class BestSellingProductsLoading extends BestSellingProductsState {}

class BestSellingProductsLoaded extends BestSellingProductsState {
  final List<ProductModel> bestSellingProducts;
  BestSellingProductsLoaded({required this.bestSellingProducts});
}

class BestSellingProductsError extends BestSellingProductsState {
  final String errorMessage;
  BestSellingProductsError({required this.errorMessage});
}
