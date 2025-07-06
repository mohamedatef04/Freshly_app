import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';

class ConvexBottomBar extends StatelessWidget {
  const ConvexBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.flip,
      backgroundColor: AppColors.whiteColor,
      color: AppColors.greyColor,
      activeColor: AppColors.primaryColor,
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.grid_view, title: 'Items'),
        TabItem(icon: Icons.shopping_cart, title: 'Cart'),
        TabItem(icon: Icons.bookmark, title: 'Wishlist'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      initialActiveIndex: 0,
      onTap: (index) {
        context.read<NavBarCubit>().changeIndex(index);
      },
    );
  }
}
