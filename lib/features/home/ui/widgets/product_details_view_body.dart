import 'package:flutter/material.dart';
import 'package:freshly_app/core/models/product_model.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_details_view_center_widget.dart';
import 'package:freshly_app/features/home/ui/widgets/custom_details_view_header_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  bool isInCart = false;
  @override
  void initState() {
    isInCart =
        widget.productModel.cartItems!
            .where(
              (e) =>
                  e['for_user'] ==
                  Supabase.instance.client.auth.currentUser!.id,
            )
            .isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,

        child: Column(
          children: [
            Expanded(
              child: CustomDetailsViewHeaderWidget(
                productModel: widget.productModel,
              ),
            ),
            Expanded(
              child: CustomDetailsViewCenterWidget(
                isAddedToCart: isInCart,
                productModel: widget.productModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
