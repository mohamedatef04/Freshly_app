import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/explore/logic/cubits/explore_cubit.dart';
import 'package:freshly_app/features/explore/ui/widgets/explore_sliver_grid_view.dart';

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  @override
  void initState() {
    context.read<ExploreCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Explore'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: const CustomScrollView(slivers: [ExploreSliverGridView()]),
      ),
    );
  }
}
