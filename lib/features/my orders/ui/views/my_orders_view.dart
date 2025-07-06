import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/services/get_it_service.dart';
import 'package:freshly_app/features/my%20orders/data/repos/my_order_repo_impl.dart';
import 'package:freshly_app/features/my%20orders/logic/cubits/get_my_orders/get_my_orders_cubit.dart';
import 'package:freshly_app/features/my%20orders/ui/widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const routeName = '/my-orders-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMyOrdersCubit(getIt.get<MyOrderRepoImpl>()),
      child: const Scaffold(body: MyOrdersViewBody()),
    );
  }
}
