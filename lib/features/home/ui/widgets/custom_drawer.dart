import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_colors.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/my%20orders/ui/views/my_orders_view.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool ligth = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: MediaQuery.sizeOf(context).width * 0.6,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Image.asset(Assets.imagesLogo, width: 50.w, height: 50.h),
                const Spacer(),
                Text(
                  'Freshly',
                  style: AppStyles.black24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(MyOrdersView.routeName);
            },
            child: ListTile(
              title: Text('My Orders', style: AppStyles.black18),
              leading: Icon(Icons.shopping_bag_outlined, size: 24.sp),
            ),
          ),
        ],
      ),
    );
  }
}
