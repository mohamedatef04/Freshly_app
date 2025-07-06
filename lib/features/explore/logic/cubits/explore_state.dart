part of 'explore_cubit.dart';

@immutable
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreItemsLoading extends ExploreState {}

class ExploreItemsLoaded extends ExploreState {
  final List<ProductModel> exploreItems;
  ExploreItemsLoaded({required this.exploreItems});
}

class ExploreItemsError extends ExploreState {
  final String errorMessage;
  ExploreItemsError({required this.errorMessage});
}
