import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/wishlist_cubit.dart';
import 'package:freshly_app/features/wishlist/ui/widgets/wish_list_item.dart';

class WishListViewBody extends StatefulWidget {
  const WishListViewBody({super.key});

  @override
  State<WishListViewBody> createState() => _WishListViewBodyState();
}

class _WishListViewBodyState extends State<WishListViewBody> {
  @override
  void initState() {
    context.read<WishlistCubit>().getWishListProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wish List'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                if (state is WishlistProductsLoaded) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 6.w,
                      mainAxisSpacing: 20.h,
                    ),
                    itemCount: state.wishlistProducts.length,
                    itemBuilder: (context, index) {
                      return WishListItem(
                        productModel: state.wishlistProducts[index],
                      );
                    },
                  );
                } else if (state is WishlistProductsAfterRemove) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 6.w,
                      mainAxisSpacing: 20.h,
                    ),
                    itemCount: state.wishlistProducts.length,
                    itemBuilder: (context, index) {
                      return WishListItem(
                        productModel: state.wishlistProducts[index],
                      );
                    },
                  );
                } else if (state is WishlistProductsEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesEmptyFav, width: 200.w),
                      Text('Your Wish List is empty', style: AppStyles.black20),
                    ],
                  );
                } else if (state is WishlistProductsError) {
                  return Center(
                    child: NoInternetWidget(message: state.errorMessage),
                  );
                } else {
                  return const Center(child: CustomAnimatedIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
