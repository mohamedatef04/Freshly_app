import 'package:bloc/bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/home/logic/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.homeRepo) : super(RatingInitial());
  final HomeRepo homeRepo;

  Future<void> addProductRate({
    required double rate,
    required ProductModel productModel,
  }) async {
    try {
      await homeRepo.addProductRate(rate: rate, productModel: productModel);
      emit(RatingValueAdded());
    } on Exception catch (e) {
      emit(RatingValueFailed(errorMessage: e.toString()));
    }
  }

  Future<void> updateProductRate({
    required double rate,
    required ProductModel productModel,
  }) async {
    try {
      await homeRepo.updateProductRate(rate: rate, productModel: productModel);
      emit(RatingValueUpdated());
    } on Exception catch (e) {
      emit(RatingValueFailed(errorMessage: e.toString()));
    }
  }
}
