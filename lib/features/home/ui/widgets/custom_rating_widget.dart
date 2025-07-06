import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freshly_app/core/models/product_model.dart';

class CustomRatingWidget extends StatefulWidget {
  const CustomRatingWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  double rate = 0.0;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: rate,

      onValueChanged: (value) {
        setState(() {
          rate = value;
        });
      },
      starCount: 5,
      starSize: 20.w,
    );
  }
}
