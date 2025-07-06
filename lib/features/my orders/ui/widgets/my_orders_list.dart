import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/widgets/custom_animated_indicator.dart';
import 'package:freshly_app/core/widgets/no_internet_screen.dart';
import 'package:freshly_app/features/my%20orders/logic/cubits/get_my_orders/get_my_orders_cubit.dart';
import 'package:freshly_app/features/my%20orders/ui/widgets/order_item.dart';

class MyOrdersList extends StatelessWidget {
  const MyOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
      builder: (context, state) {
        if (state is GetMyOrdersSuccess) {
          return ListView.builder(
            itemCount: state.myOrders.length,
            itemBuilder: (context, index) {
              return OrderItem(productModel: state.myOrders[index]);
            },
          );
        } else if (state is MyOrdersIsEmpty) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('No orders yet', style: AppStyles.black20)],
            ),
          );
        } else if (state is GetMyOrdersFailure) {
          return Center(child: NoInternetWidget(message: state.errorMessage));
        } else {
          return const Center(child: CustomAnimatedIndicator());
        }
      },
    );
  }
}
