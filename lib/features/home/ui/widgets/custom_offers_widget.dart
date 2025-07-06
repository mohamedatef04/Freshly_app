import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomOffersWidget extends StatefulWidget {
  const CustomOffersWidget({super.key});

  @override
  State<CustomOffersWidget> createState() => _CustomOffersWidgetState();
}

class _CustomOffersWidgetState extends State<CustomOffersWidget> {
  final List<String> images = [
    "https://img.freepik.com/free-vector/grocery-store-facebook-template_23-2151089773.jpg?uid=R145483694&ga=GA1.1.918032716.1736258875&semt=ais_items_boosted&w=740",
    "https://img.freepik.com/premium-psd/banner-fresh-vegetable-30-off-template-design-3d-render_363450-864.jpg?uid=R145483694&ga=GA1.1.918032716.1736258875&semt=ais_items_boosted&w=740",
    "https://img.freepik.com/free-vector/hand-drawn-local-market-business-sale-banner-template_23-2149509599.jpg?uid=R145483694&ga=GA1.1.918032716.1736258875&semt=ais_items_boosted&w=740",
  ];
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  imageBuilder:
                      (context, imageProvider) => Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 180.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.grey,
            activeDotColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
