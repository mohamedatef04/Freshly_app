import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomOnboardingBottom extends StatelessWidget {
  const CustomOnboardingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://img.freepik.com/free-vector/shopping-supermarket-cart-with-grocery-pictogram_1284-11697.jpg?uid=R145483694&ga=GA1.1.918032716.1736258875&semt=ais_items_boosted&w=740",
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
      placeholder:
          (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
