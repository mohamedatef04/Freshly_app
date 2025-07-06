import 'package:flutter/material.dart';
import 'package:freshly_app/core/utils/assets.dart';
import 'package:freshly_app/features/home/data/models/categories_item_model.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_category_index.dart';

class CategoriesItems extends StatefulWidget {
  const CategoriesItems({super.key});

  @override
  State<CategoriesItems> createState() => _CategoriesItemsState();
}

class _CategoriesItemsState extends State<CategoriesItems> {
  final List<CategoriesItemModel> categoriesItems = [
    CategoriesItemModel(image: Assets.imagesDryGoods, title: 'Dry Goods'),
    CategoriesItemModel(image: Assets.imagesFruitsCategory, title: 'Fruits'),
    CategoriesItemModel(image: Assets.imagesSnacks, title: 'Snacks'),
    CategoriesItemModel(image: Assets.imagesHousehold, title: 'Household'),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          categoriesItems
              .map(
                (e) => Expanded(
                  child: CustomCategoryIndex(categoriesItemModel: e),
                ),
              )
              .toList(),
    );
  }
}
