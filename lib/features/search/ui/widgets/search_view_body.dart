import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:freshly_app/features/search/logic/cubits/search_cubit.dart';
import 'package:freshly_app/features/search/ui/widgets/search_grid_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    context.read<SearchCubit>().getSearchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search',
        icon: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    onChanged: (value) {
                      context.read<SearchCubit>().getSearchProductsByQuery(
                        query: value,
                      );
                    },
                  ),
                ),
                const SearchGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
