import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/core/widgets/custom_app_bar.dart';
import 'package:freshly_app/features/home/data/models/categories_item_model.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_category_index.dart';

class AllCategoriesViewBody extends StatefulWidget {
  const AllCategoriesViewBody({super.key});

  @override
  State<AllCategoriesViewBody> createState() => _AllCategoriesViewBodyState();
}

class _AllCategoriesViewBodyState extends State<AllCategoriesViewBody> {
  final List<CategoriesItemModel> allCategoryItemsOne = [
    CategoriesItemModel(title: 'Bakery', image: Assets.imagesBakery),
    CategoriesItemModel(title: 'Dairy', image: Assets.imagesDairyCategory),
    CategoriesItemModel(title: 'Dry Goods', image: Assets.imagesDryGoods),
    CategoriesItemModel(title: 'Drinks', image: Assets.imagesDrinks),
  ];
  final List<CategoriesItemModel> allCategoryItemsTwo = [
    CategoriesItemModel(title: 'Fruits', image: Assets.imagesFruitsCategory),
    CategoriesItemModel(
      title: 'Vegetables',
      image: Assets.imagesVegetablesCategory,
    ),
    CategoriesItemModel(title: 'Snacks', image: Assets.imagesSnacks),
    CategoriesItemModel(title: 'Meat', image: Assets.imagesMeat),
  ];
  final List<CategoriesItemModel> allCategoryItemsThree = [
    CategoriesItemModel(title: 'Health', image: Assets.imagesHealthCare),
    CategoriesItemModel(title: 'Household', image: Assets.imagesHousehold),
    CategoriesItemModel(
      title: 'Personal Care',
      image: Assets.imagesPersonalCare,
    ),
    CategoriesItemModel(title: 'Pet Supplies', image: Assets.imagesPetSupplies),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Categories'),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      allCategoryItemsOne
                          .map(
                            (e) => Expanded(
                              child: CustomCategoryIndex(
                                categoriesItemModel: e,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      allCategoryItemsTwo
                          .map(
                            (e) => Expanded(
                              child: CustomCategoryIndex(
                                categoriesItemModel: e,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      allCategoryItemsThree
                          .map(
                            (e) => Expanded(
                              child: CustomCategoryIndex(
                                categoriesItemModel: e,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
