import 'package:flutter/material.dart';
import 'package:freshly_app/features/home/ui/widgets/all_categories_view_body.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});
  static const String routeName = '/All-Categories-View';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AllCategoriesViewBody());
  }
}
