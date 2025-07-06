import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/explore/logic/cubits/explore_cubit.dart';
import 'package:freshly_app/features/explore/ui/widgets/item.dart';

class ExploreSliverGridView extends StatelessWidget {
  const ExploreSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ExploreItemsLoaded) {
          return SliverGrid.builder(
            itemCount: state.exploreItems.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 20.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Item(productModel: state.exploreItems[index]),
              );
            },
          );
        } else if (state is ExploreItemsError) {
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
