import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/home/logic/cubits/category%20products/category_products_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/category_item.dart';

class CategoryViewGridview extends StatelessWidget {
  const CategoryViewGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        if (state is CategoryProductsLoaded) {
          return SliverGrid.builder(
            itemCount: state.categoryProducts.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 6.w,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return CategoryItem(productModel: state.categoryProducts[index]);
            },
          );
        } else if (state is CategoryProductsError) {
          return SliverToBoxAdapter(
            child: NoInternetWidget(message: state.errorMessage),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomAnimatedIndicator()],
              ),
            ),
          );
        }
      },
    );
  }
}
