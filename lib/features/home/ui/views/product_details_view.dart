import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_custom_toast.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/logic/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  static const routeName = '/product-details-view';
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartCubit(getIt.get<CartRepoImpl>()),
      child: Scaffold(
        body: BlocConsumer<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state is AddToCartSuccess) {
              showCustomToast(
                context,
                message: 'Product Added to cart successfully',
                color: AppColors.primaryColor,
                titleText: 'Success',
                type: AnimatedSnackBarType.success,
              );
            } else if (state is AddToCartFailure) {
              showCustomToast(
                context,
                message: state.errorMessage,
                color: AppColors.primaryColor,
                titleText: 'Error',
                type: AnimatedSnackBarType.error,
              );
            } else {
              showCustomToast(
                context,
                message: 'Product Already In Your cart',
                color: AppColors.primaryColor,
                titleText: 'Info',
                type: AnimatedSnackBarType.info,
              );
            }
          },
          builder: (context, state) {
            return ProductDetailsViewBody(productModel: productModel);
          },
        ),
      ),
    );
  }
}
