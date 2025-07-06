import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/explore/logic/repos/explore_repo.dart';
import 'package:meta/meta.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.exploreRepo) : super(ExploreInitial());
  final ExploreRepo exploreRepo;

  Future<void> getAllProducts() async {
    emit(ExploreItemsLoading());
    final res = await exploreRepo.getAllProducts();
    res.fold(
      (l) => emit(ExploreItemsError(errorMessage: l.errorMessage)),
      (r) => emit(ExploreItemsLoaded(exploreItems: r)),
    );
  }
}
