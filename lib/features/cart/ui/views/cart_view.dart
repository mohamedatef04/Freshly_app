import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/functions/show_custom_toast.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/logic/cubits/cart_item/cart_item_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';
import 'package:freshly_app/features/cart/ui/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = '/cart-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartItemCubit()),
        BlocProvider(create: (context) => CartCubit(getIt.get<CartRepoImpl>())),
      ],
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartProductsRemoved) {
            showCustomToast(
              context,
              message: 'Product removed from cart',
              color: AppColors.primaryColor,
              titleText: 'Success',
              type: AnimatedSnackBarType.success,
            );
          }
        },
        builder: (context, state) {
          return const Scaffold(body: CartViewBody());
        },
      ),
    );
  }
}
