import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/features/home/ui/views/product_details_view.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/wishlist_cubit.dart';
import 'package:go_router/go_router.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(ProductDetailsView.routeName, extra: productModel);
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.shade400,
        color: const Color(0xffF3F5F7),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.white),
        ),

        child: Container(
          width: 163.w,
          height: 214.h,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: CachedNetworkImage(
                    imageUrl: productModel.image ?? '',
                    width: 150.w,
                    placeholder:
                        (context, url) => const CustomAnimatedIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Text(
                  productModel.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.grey16.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible:
                            productModel.category == 'Fruits' ||
                            productModel.category == 'Dairy' ||
                            productModel.category == 'Vegetables' ||
                            productModel.category == 'Dry Goods' ||
                            productModel.category == 'Meat',
                        child: Text(
                          '1 kg , ',
                          style: AppStyles.black18.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text(
                        ' ${productModel.price}\$ ',
                        style: AppStyles.black18.copyWith(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<WishlistCubit>().removeFromWishList(
                          productModel: productModel,
                        );
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.imagesDelete,
                            color: Colors.white,
                            width: 25.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
