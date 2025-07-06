import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/functions/paymob_payment.dart';
import 'package:freshly_app/core/network/supabase_constants.dart';
import 'package:freshly_app/core/routing/app_routes.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:freshly_app/features/cart/data/repos/checkout_repo_impl.dart';
import 'package:freshly_app/features/cart/logic/cubits/get%20cart%20items/get_cart_products_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/order%20details/order_details_cubit.dart';
import 'package:freshly_app/features/cart/logic/cubits/empty_cart_after_order/empty_cart_after_order_cubit.dart';
import 'package:freshly_app/features/my%20orders/data/repos/my_order_repo_impl.dart';
import 'package:freshly_app/features/my%20orders/logic/cubits/store_order/store_order_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  getItSetUp();
  payMobPayment();
  runApp(const FreshlyApp());
}

class FreshlyApp extends StatefulWidget {
  const FreshlyApp({super.key});

  @override
  State<FreshlyApp> createState() => _FreshlyAppState();
}

class _FreshlyAppState extends State<FreshlyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => OrderDetailsCubit(getIt.get<CheckoutRepoImpl>()),
          ),
          BlocProvider(
            create:
                (context) =>
                    EmptyCartAfterOrderCubit(getIt.get<CartRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => CartCubit(getIt.get<CartRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => StoreOrderCubit(getIt.get<MyOrderRepoImpl>()),
          ),
        ],
        child: MaterialApp.router(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xffFFFFFF),
            brightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}
