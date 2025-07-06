import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CachedNetworkImage(
                      imageUrl: productModel.image ?? '',

                      placeholder:
                          (context, url) => const CustomAnimatedIndicator(),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(productModel.name ?? '', style: AppStyles.black18),
                        Text(
                          productModel.purchasedProducts!
                                      .map((x) => x['product_status'])
                                      .join('') ==
                                  'done'
                              ? 'Shipped'
                              : 'Pending',

                          style:
                              productModel.purchasedProducts!
                                          .map((x) => x['product_status'])
                                          .join('') ==
                                      'done'
                                  ? AppStyles.black14.copyWith(
                                    color: Colors.green,
                                  )
                                  : AppStyles.grey16,
                        ),
                        Text(
                          productModel.purchasedProducts!
                              .map((x) => x['created_at'])
                              .join(', ')
                              .substring(0, 10),
                          textAlign: TextAlign.center,

                          style: AppStyles.black14,
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Text(
                      '\$${productModel.price}',
                      style: AppStyles.black18,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
