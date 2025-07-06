import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/features/cart/logic/cubits/cart_item/cart_item_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.productModel == widget.productModel) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Container(
            width: MediaQuery.sizeOf(context).width,

            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: widget.productModel.image ?? '',
                          width: 70.w,
                          placeholder:
                              (context, url) => const CustomAnimatedIndicator(),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          spacing: 10.w,
                          children: [
                            Text(
                              widget.productModel.name ?? '',
                              textAlign: TextAlign.center,
                              style: AppStyles.grey16.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible:
                                      widget.productModel.category ==
                                          'Fruits' ||
                                      widget.productModel.category == 'Dairy' ||
                                      widget.productModel.category ==
                                          'Vegetables' ||
                                      widget.productModel.category ==
                                          'Dry Goods' ||
                                      widget.productModel.category == 'Meat',
                                  child: Text(
                                    '1 kg / ',
                                    style: AppStyles.black14,
                                  ),
                                ),
                                Text('price', style: AppStyles.black14),
                              ],
                            ),

                            Row(
                              spacing: 9.w,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    widget.productModel.decrement();
                                    context
                                        .read<CartItemCubit>()
                                        .updataCartItem(widget.productModel);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: AppStyles.black18,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  widget.productModel.quantity.toString(),
                                  style: AppStyles.black18,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.productModel.icreasement();
                                    context
                                        .read<CartItemCubit>()
                                        .updataCartItem(widget.productModel);
                                  },
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                      ),

                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: AppStyles.black18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 35.h,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<CartCubit>().removeFromCart(
                                  productModel: widget.productModel,
                                );
                              },
                              child: Image.asset(
                                Assets.imagesDelete,
                                width: 24.w,
                              ),
                            ),
                            Text(
                              '\$ ${widget.productModel.calculatePrice()}',
                              style: AppStyles.black18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.greyColor,
                    thickness: 0.5,
                    height: 1.h,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
