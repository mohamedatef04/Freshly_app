import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/utils/assets.dart';

class CustomDetailsViewHeaderWidget extends StatelessWidget {
  const CustomDetailsViewHeaderWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesDetailsShape),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: CachedNetworkImage(
              imageUrl: productModel.image ?? '',
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          top: 40.h,
          left: 20.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(Assets.imagesArrowBack, width: 22.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
