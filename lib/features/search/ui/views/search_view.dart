import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_custom_toast.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/logic/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:freshly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:freshly_app/features/search/logic/cubits/search_cubit.dart';
import 'package:freshly_app/features/search/ui/widgets/search_view_body.dart';
import 'package:freshly_app/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/add_to_wishlist_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = '/search-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(getIt.get<CartRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) => AddToWishlistCubit(getIt.get<WishlistRepoImpl>()),
        ),
      ],
      child: BlocConsumer<AddToCartCubit, AddToCartState>(
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
          return BlocConsumer<AddToWishlistCubit, AddToWishlistState>(
            listener: (context, state) {
              if (state is AddToWishlistSuccess) {
                showCustomToast(
                  context,
                  message: 'Product Added to Wishlist successfully',
                  color: AppColors.primaryColor,
                  titleText: 'Success',
                  type: AnimatedSnackBarType.success,
                );
              } else if (state is AddToWishlistFailure) {
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
                  message: 'Product Removed from wishlist',
                  color: AppColors.primaryColor,
                  titleText: 'Success',
                  type: AnimatedSnackBarType.success,
                );
              }
            },
            builder: (context, state) {
              return const Scaffold(body: SearchViewBody());
            },
          );
        },
      ),
    );
  }
}
