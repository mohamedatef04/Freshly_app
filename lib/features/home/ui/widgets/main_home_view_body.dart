import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/widgets/convex_bottom_bar.dart';
import 'package:freshly_app/features/cart/ui/views/cart_view.dart';
import 'package:freshly_app/features/explore/ui/views/explore_view.dart';
import 'package:freshly_app/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:freshly_app/features/home/ui/views/home_view.dart';
import 'package:freshly_app/features/profile/ui/views/profile_view.dart';
import 'package:freshly_app/features/wishlist/ui/views/wish_list_view.dart';

class MainHomeViewBody extends StatefulWidget {
  const MainHomeViewBody({super.key});

  @override
  State<MainHomeViewBody> createState() => _MainHomeViewBodyState();
}

class _MainHomeViewBodyState extends State<MainHomeViewBody> {
  final List<Widget> views = const [
    HomeView(),
    ExploreView(),
    CartView(),
    WishListView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        if (state is NavBarIndexChanged) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: views[context.read<NavBarCubit>().currentIndex],
          bottomNavigationBar: const ConvexBottomBar(),
        );
      },
    );
  }
}
