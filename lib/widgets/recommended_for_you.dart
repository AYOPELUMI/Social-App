import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/home_controller.dart';
import '../data/book_model.dart';

class RecommendedForYou extends StatelessWidget {
  const RecommendedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(), // Initialize the controller
      builder: (controller) {
        return Obx(() {
          // Using Obx to reactively update the widget when `recommendedForYou` changes
          return CarouselSlider(
            options: CarouselOptions(
              height: 327,
              autoPlay: true,
              enlargeCenterPage: false,
              padEnds: false,
              disableCenter: true,
              viewportFraction: 0.65,
            ),
            items: controller.recommendedForYou.map((item) {
              return _buildCarouselItem(context, item);
            }).toList(),
          );
        });
      },
    );
  }

  // Helper method to build carousel item
  Widget _buildCarouselItem(BuildContext context, Book item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageCard(context),
        const SizedBox(height: 12),
        _buildTitleText(context, item.title),
        _buildAuthorText(context, item.authors[0].name),
        _buildRatingRow(context),
      ],
    );
  }

  // Widget to build the image card with a favorite button
  Widget _buildImageCard(BuildContext context) {
    return Container(
      height: 257,
      margin: const EdgeInsets.only(right: 16),
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
    );
  }

  // Widget to build title text
  Widget _buildTitleText(BuildContext context, String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  // Widget to build author text
  Widget _buildAuthorText(BuildContext context, String authorName) {
    return Text(
      authorName,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  // Widget to build the rating row
  Widget _buildRatingRow(BuildContext context) {
    return Row(
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
                fontSize: 14,
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Use secondary color from theme
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
