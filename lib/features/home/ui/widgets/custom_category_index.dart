import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/home/data/models/categories_item_model.dart';
import 'package:freshly_app/features/home/ui/views/category_view.dart';
import 'package:go_router/go_router.dart';

class CustomCategoryIndex extends StatelessWidget {
  const CustomCategoryIndex({super.key, required this.categoriesItemModel});
  final CategoriesItemModel categoriesItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3.h,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(CategoryView.routeName, extra: categoriesItemModel);
          },
          child: Container(
            width: 73.w,
            height: 73.h,
            decoration: const BoxDecoration(
              color: Color(0xffF3F5F7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(categoriesItemModel.image, width: 34.w),
            ),
          ),
        ),
        Text(
          categoriesItemModel.title,
          textAlign: TextAlign.center,
          style: AppStyles.black14.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
