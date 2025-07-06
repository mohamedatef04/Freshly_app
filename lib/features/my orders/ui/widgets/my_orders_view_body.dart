import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/my%20orders/logic/cubits/get_my_orders/get_my_orders_cubit.dart';
import 'package:freshly_app/features/my%20orders/ui/widgets/my_orders_list.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  @override
  void initState() {
    context.read<GetMyOrdersCubit>().getMyOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'My Orders'),
      body: MyOrdersList(),
    );
  }
}
