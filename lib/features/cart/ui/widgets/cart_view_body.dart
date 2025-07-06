import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/cart/logic/cubits/cart_item/cart_item_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';
import 'package:freshly_app/features/cart/ui/widgets/cart_products_list.dart';
import 'package:freshly_app/features/cart/ui/widgets/custom_modal_bottom_sheet.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CartCubit>().getCartProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Cart'),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,

          child: Stack(
            children: [
              const CartProductsList(),

              BlocBuilder<CartItemCubit, CartItemState>(
                builder: (context, state) {
                  return Visibility(
                    visible: context.read<CartCubit>().isEmpty == false,
                    child: Positioned(
                      bottom: 30.h,
                      left: MediaQuery.sizeOf(context).width * 0.05,

                      child: GestureDetector(
                        onTap: () {
                          cusomModalBottomSheet(
                            context,
                            price:
                                context.read<CartCubit>().calculateTotalPrice(),
                            cartProducts:
                                context.read<CartCubit>().cartProducts!,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,

                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Center(
                            child: Text(
                              'Checkout \$ ${context.watch<CartCubit>().calculateTotalPrice()}',
                              style: AppStyles.white16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
