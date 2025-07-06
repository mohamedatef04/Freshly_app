import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/home/data/models/categories_item_model.dart';
import 'package:freshly_app/features/home/logic/cubits/category%20products/category_products_cubit.dart';
import 'package:freshly_app/features/home/ui/widgets/category_view_gridview.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.categoriesItemModel});
  final CategoriesItemModel categoriesItemModel;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    context.read<CategoryProductsCubit>().getCategortProducts(
      category: widget.categoriesItemModel.title,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.categoriesItemModel.title,
        icon: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: const CustomScrollView(slivers: [CategoryViewGridview()]),
      ),
    );
  }
}
