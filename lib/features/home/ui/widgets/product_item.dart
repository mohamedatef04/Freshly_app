import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/features/cart/logic/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:freshly_app/features/home/ui/views/product_details_view.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/add_to_wishlist_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isInCart = false;
  bool isFavourite = false;
  @override
  void initState() {
    isInCart =
        widget.productModel.cartItems!
            .where(
              (e) =>
                  e['for_user'] ==
                  Supabase.instance.client.auth.currentUser!.id,
            )
            .isNotEmpty;
    isFavourite =
        widget.productModel.wishlistProducts!
            .where(
              (e) =>
                  e['for_user'] ==
                  Supabase.instance.client.auth.currentUser!.id,
            )
            .isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(ProductDetailsView.routeName, extra: widget.productModel);
      },
      child: Card(
        elevation: 15,
        color: const Color(0xffF3F5F7),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.ligthWhiteColor),
        ),

        child: Container(
          width: 163.w,

          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: widget.productModel.image ?? '',
                        width: 150.w,
                        placeholder:
                            (context, url) =>
                                const Center(child: CustomAnimatedIndicator()),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                              context.read<AddToWishlistCubit>().addToWishlist(
                                productModel: widget.productModel,
                              );
                            });
                          },
                          child:
                              isFavourite
                                  ? Image.asset(
                                    Assets.imagesRedHeart,
                                    height: 25.h,
                                  )
                                  : Image.asset(
                                    Assets.imagesHeart,
                                    height: 25.h,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.productModel.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.grey16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AddToCartCubit>().addToCart(
                        productModel: widget.productModel,
                      );
                      setState(() {
                        isInCart = true;
                      });
                    },
                    child:
                        isInCart
                            ? Container(
                              width: 120.w,

                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: Text(
                                  'In Your Cart',
                                  style: AppStyles.white16,
                                ),
                              ),
                            )
                            : Container(
                              width: 120.w,

                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Add to Cart',
                                  style: AppStyles.black14,
                                ),
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
