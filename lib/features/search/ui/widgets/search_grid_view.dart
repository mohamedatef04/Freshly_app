import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/search/logic/cubits/search_cubit.dart';
import 'package:freshly_app/features/search/ui/widgets/seach_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchProductsLoaded) {
          return SliverGrid.builder(
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 6.w,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return SeachItem(productModel: state.products[index]);
            },
          );
        } else if (state is SearchProductsLoadedSearchItems) {
          return SliverGrid.builder(
            itemCount: state.searchItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 6.w,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return SeachItem(productModel: state.searchItems[index]);
            },
          );
        } else if (state is SearchProductsError) {
          return SliverToBoxAdapter(
            child: NoInternetWidget(message: state.errorMessage),
          );
        } else if (state is SearchProductsNotFound) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('There is no products', style: AppStyles.black24),
            ),
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
