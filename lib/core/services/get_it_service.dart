import 'package:freshly_app/core/network/api_service.dart';
import 'package:freshly_app/core/services/supabase_auth_service.dart';
import 'package:freshly_app/core/services/supabase_database_service.dart';
import 'package:freshly_app/core/services/supabase_storage_service.dart';
import 'package:freshly_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/data/repos/checkout_repo_impl.dart';
import 'package:freshly_app/features/explore/data/repos/explore_repo_impl.dart';
import 'package:freshly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:freshly_app/features/my%20orders/data/repos/my_order_repo_impl.dart';
import 'package:freshly_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:freshly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:freshly_app/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItSetUp() {
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<SupabaseDatabaseService>(SupabaseDatabaseService());
  getIt.registerSingleton<SupabaseStorageService>(SupabaseStorageService());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<SupabaseAuthService>(),
      getIt.get<SupabaseDatabaseService>(),
    ),
  );

  getIt.registerSingleton<ExploreRepoImpl>(
    ExploreRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<CheckoutRepoImpl>(
    CheckoutRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<WishlistRepoImpl>(
    WishlistRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      apiService: getIt.get<ApiService>(),
      storageService: getIt.get<SupabaseStorageService>(),
    ),
  );
  getIt.registerSingleton<MyOrderRepoImpl>(
    MyOrderRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
