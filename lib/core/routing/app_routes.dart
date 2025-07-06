import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/auth/ui/views/forget_password_view.dart';
import 'package:freshly_app/features/auth/ui/views/login_view.dart';
import 'package:freshly_app/features/auth/ui/views/signup_view.dart';
import 'package:freshly_app/features/cart/ui/views/cart_view.dart';
import 'package:freshly_app/features/explore/ui/views/explore_view.dart';
import 'package:freshly_app/features/home/data/models/categories_item_model.dart';
import 'package:freshly_app/features/home/ui/views/all_categories_view.dart';
import 'package:freshly_app/features/home/ui/views/category_view.dart';
import 'package:freshly_app/features/home/ui/views/home_view.dart';
import 'package:freshly_app/features/home/ui/views/main_home_view.dart';
import 'package:freshly_app/features/home/ui/views/product_details_view.dart';
import 'package:freshly_app/features/my%20orders/ui/views/my_orders_view.dart';
import 'package:freshly_app/features/onboarding/ui/views/onboarding_view.dart';
import 'package:freshly_app/features/profile/ui/views/profile_view.dart';
import 'package:freshly_app/features/search/ui/views/search_view.dart';
import 'package:freshly_app/features/splash/ui/views/splash_view.dart';
import 'package:freshly_app/features/wishlist/ui/views/wish_list_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(
      path: OnboardingView.routeName,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: LoginView.routeName,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: SignupView.routeName,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: ForgetPasswordView.routeName,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: MainHomeView.routeName,
      builder: (context, state) => const MainHomeView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: CategoryView.routeName,
      builder:
          (context, state) => CategoryView(
            categoriesItemModel: state.extra as CategoriesItemModel,
          ),
    ),
    GoRoute(
      path: AllCategoriesView.routeName,
      builder: (context, state) => const AllCategoriesView(),
    ),
    GoRoute(
      path: ProductDetailsView.routeName,
      builder:
          (context, state) =>
              ProductDetailsView(productModel: state.extra as ProductModel),
    ),
    GoRoute(
      path: SearchView.routeName,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: ExploreView.routeName,
      builder: (context, state) => const ExploreView(),
    ),
    GoRoute(
      path: CartView.routeName,
      builder: (context, state) => const CartView(),
    ),

    GoRoute(
      path: WishListView.routeName,
      builder: (context, state) => const WishListView(),
    ),
    GoRoute(
      path: ProfileView.routeName,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: MyOrdersView.routeName,
      builder: (context, state) => const MyOrdersView(),
    ),
  ],
);
