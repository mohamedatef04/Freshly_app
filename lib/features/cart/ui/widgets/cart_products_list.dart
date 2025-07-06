import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';
import 'package:freshly_app/features/cart/ui/widgets/cart_item.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartProductsLoaded) {
          return ListView.builder(
            itemCount: state.cartProducts.length,
            itemBuilder: (context, index) {
              return CartItem(productModel: state.cartProducts[index]);
            },
          );
        } else if (state is CartProductsIsEmpty) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesEmptyCart, width: 200.w),
                Text('Your Cart is empty', style: AppStyles.black20),
              ],
            ),
          );
        } else if (state is CartProductsAfterRemove) {
          return ListView.builder(
            itemCount: state.cartProducts.length,
            itemBuilder: (context, index) {
              return CartItem(productModel: state.cartProducts[index]);
            },
          );
        } else if (state is CartProductsError) {
          return Center(child: NoInternetWidget(message: state.errorMessage));
        } else {
          return const Center(child: CustomAnimatedIndicator());
        }
      },
    );
  }
}
