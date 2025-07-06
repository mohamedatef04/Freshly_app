import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/cart/logic/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_add_to_cart_button.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_product_ingridient.dart';

class CustomDetailsViewCenterWidget extends StatefulWidget {
  const CustomDetailsViewCenterWidget({
    super.key,
    required this.productModel,
    required this.isAddedToCart,
  });
  final ProductModel productModel;
  final bool isAddedToCart;

  @override
  State<CustomDetailsViewCenterWidget> createState() =>
      _CustomDetailsViewCenterWidgetState();
}

class _CustomDetailsViewCenterWidgetState
    extends State<CustomDetailsViewCenterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.productModel.name ?? '', style: AppStyles.black24),
            ],
          ),
          Row(
            children: [
              Visibility(
                visible:
                    widget.productModel.category == 'Fruits' ||
                    widget.productModel.category == 'Dairy' ||
                    widget.productModel.category == 'Vegetables' ||
                    widget.productModel.category == 'Dry Goods' ||
                    widget.productModel.category == 'Meat',
                child: Text(
                  '1 kg , ',
                  style: AppStyles.black18.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                ' ${widget.productModel.price}\$ ',
                style: AppStyles.black18.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              widget.productModel.description ?? '',

              style: AppStyles.grey16.copyWith(fontSize: 17.sp, height: 1.2.h),
            ),
          ),

          Expanded(
            child: Row(
              spacing: 5.w,
              children: [
                const Expanded(
                  child: CustomProductIngredient(
                    image: Assets.imagesReviews,
                    text: '4.8 (20)',
                    title: 'Reviews',
                  ),
                ),
                Expanded(
                  child: CustomProductIngredient(
                    image: Assets.imagesExpireDate,
                    text: widget.productModel.expirationDate ?? '',
                    title: 'EXpiration',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Visibility(
            visible:
                widget.productModel.category == 'Bakery' ||
                widget.productModel.category == 'Meat' ||
                widget.productModel.category == 'Dry Goods' ||
                widget.productModel.category == 'Drinks' ||
                widget.productModel.category == 'Dairy' ||
                widget.productModel.category == 'Snacks' ||
                widget.productModel.category == 'Fruits' ||
                widget.productModel.category == 'Vegetables',
            child: Expanded(
              child: Row(
                spacing: 5.w,
                children: [
                  Expanded(
                    child: CustomProductIngredient(
                      image: Assets.imagesOrganic,
                      text: '${widget.productModel.organicPercentage ?? ''} %',
                      title: 'Organic',
                    ),
                  ),
                  Expanded(
                    child: CustomProductIngredient(
                      image: Assets.imagesCalories,
                      text: '${widget.productModel.calories ?? ''} kcal',
                      title: '100 Gram',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),

          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<AddToCartCubit>().addToCart(
                  productModel: widget.productModel,
                );
              },
              child:
                  widget.isAddedToCart == true
                      ? CustomAddToCartButton(
                        buttonText: 'In Your cart',
                        color: AppColors.blackColor,
                        productModel: widget.productModel,
                      )
                      : CustomAddToCartButton(
                        buttonText: 'Add to cart',
                        color: AppColors.primaryColor,
                        productModel: widget.productModel,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
