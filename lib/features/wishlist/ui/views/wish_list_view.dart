import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_custom_toast.dart';
import 'package:freshly_app/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/wishlist_cubit.dart';
import 'package:freshly_app/features/wishlist/ui/widgets/wish_list_view_body.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});
  static const routeName = '/wishlist-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(getIt.get<WishlistRepoImpl>()),
      child: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {
          if (state is WishlistProductsRemoveSuccess) {
            showCustomToast(
              context,
              message: 'Product removed successfully',
              color: AppColors.primaryColor,
              titleText: 'Success',
              type: AnimatedSnackBarType.success,
            );
          }
        },
        builder: (context, state) {
          return const Scaffold(body: WishListViewBody());
        },
      ),
    );
  }
}
