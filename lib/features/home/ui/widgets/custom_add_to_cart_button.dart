import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/core/theme/app_styles.dart';

class CustomAddToCartButton extends StatelessWidget {
  const CustomAddToCartButton({
    super.key,
    required this.productModel,
    required this.buttonText,
    required this.color,
  });
  final ProductModel productModel;
  final String buttonText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 50.h,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(child: Text(buttonText, style: AppStyles.white16)),
    );
  }
}
