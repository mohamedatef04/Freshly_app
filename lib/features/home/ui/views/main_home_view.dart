import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/logic/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';
import 'package:freshly_app/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/main_home_view_body.dart';
import 'package:freshly_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:freshly_app/features/profile/logic/cubits/user_details_cubit.dart';
import 'package:freshly_app/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:freshly_app/features/wishlist/logic/cubits/add_to_wishlist_cubit.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});
  static const routeName = '/main-home-view';

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => CartCubit(getIt.get<CartRepoImpl>())),
        BlocProvider(
          create: (context) => AddToCartCubit(getIt.get<CartRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) => AddToWishlistCubit(getIt.get<WishlistRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => UserDetailsCubit(getIt.get<ProfileRepoImpl>()),
        ),
      ],
      child: const Scaffold(body: MainHomeViewBody()),
    );
  }
}
