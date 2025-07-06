import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/home/logic/cubits/best%20selling%20products/best_selling_products_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/product_item.dart';

class BestSellingGridview extends StatelessWidget {
  const BestSellingGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellingProductsCubit, BestSellingProductsState>(
      builder: (context, state) {
        if (state is BestSellingProductsLoaded) {
          return SliverGrid.builder(
            itemCount: state.bestSellingProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 20.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ProductItem(
                  productModel: state.bestSellingProducts[index],
                ),
              );
            },
          );
        } else if (state is BestSellingProductsError) {
          return SliverToBoxAdapter(
            child: NoInternetWidget(message: state.errorMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CustomAnimatedIndicator()),
          );
        }
      },
    );
  }
}
