import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/home_controller.dart';
import 'package:social_app/widgets/recommended_for_you.dart';

import '../widgets/new_arrival.dart';
import '../widgets/recently_borrowed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme colors and text styles
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ??
        Colors.black; // Fallback to black if null
    final primaryColor =
        theme.colorScheme.primary; // Use the primary color from the theme
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 44, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 19.5,
                    backgroundColor:
                        primaryColor, // Use the primary color from the theme
                    child: ClipOval(
                      child: Image.asset(
                        'assets/avatar.png', // Replace with your image asset
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 50,
                            color: theme
                                .iconTheme.color, // Use the theme's icon color
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      Text(
                        "Welcome Back!",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize:
                              12.0, // Use a constant or modify for your app's size
                        ),
                      ),
                      Text(
                        "Ovie Victor",
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              16.0, // Use a constant or modify for your app's size
                        ),
                      )
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: () =>
                    Get.toNamed('/notifications'), // Replace with your route
                child: Icon(
                  Icons.notifications_outlined,
                  size: 24,
                  color: primaryColor, // Use the primary color from the theme
                  fill: 1.0,
                ),
              ),
            ],
          ),
          // Recently Borrowed Carousel
          _buildSectionTitle('Recently Borrowed'),
          RecentlyBorrowed(),

          // New Arrival Carousel
          _buildSectionTitle('New Arrival'),
          NewArrival(),

          // Recommended For You Carousel
          _buildSectionTitle('Recommended For You'),
          RecommendedForYou()
        ],
      ),
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}
