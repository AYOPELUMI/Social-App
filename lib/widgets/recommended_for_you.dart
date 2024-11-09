import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/home_controller.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: false,
        padEnds: false,
        disableCenter: true,
        viewportFraction: 0.55,
      ),
      items: controller.recommendedForYou.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 127,
                  height: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4DADA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // Handle onPressed action here
                            },
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color, // Use theme color for icon
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  item,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Text(
                  item,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 18,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Use theme color for icon
                    ),
                    Text(
                      "4.5",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize:
                                14, // Replace with `AppSizes.fontSizeSmb` if defined
                            color: Theme.of(context)
                                .colorScheme
                                .secondary, // Use secondary color from theme
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
