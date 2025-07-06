import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/theme/app_styles.dart';
import 'package:freshly_app/features/home/logic/cubits/best%20selling%20products/best_selling_products_cubit.dart';
import 'package:freshly_app/features/home/ui/views/all_categories_view.dart';
import 'package:freshly_app/features/home/ui/widgets/best_selling_gridview.dart';
import 'package:freshly_app/features/home/ui/widgets/categories_items.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_drawer.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_listtile.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_offers_widget.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_row_title.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<BestSellingProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomListtile(scaffoldKey: scaffoldKey),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  const SliverToBoxAdapter(child: CustomOffersWidget()),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        const CustomRowTitle(title: 'Categories'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).push(AllCategoriesView.routeName);
                          },
                          child: Text('See all', style: AppStyles.grey16),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  const SliverToBoxAdapter(child: CategoriesItems()),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  const SliverToBoxAdapter(
                    child: CustomRowTitle(title: 'Best Selling'),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  const BestSellingGridview(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
