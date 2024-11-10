import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/routes/app_routes.dart';
import 'package:social_app/widgets/recommended_for_you.dart';

import '../Controllers/books_list_controller.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/new_arrival.dart';
import '../widgets/recently_borrowed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme colors and text styles
    final theme = Theme.of(context);
    final primaryColor =
        theme.colorScheme.primary; // Use the primary color from the theme
    final TextEditingController searchController = TextEditingController();
    final BookController controller = Get.put(BookController());
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

          CustomSearchBar(
            searchController: searchController,
            onSearchChanged: (value) => controller.searchBooks(value),
          ),

          // Recently Borrowed Carousel
          _buildSectionTitle('Recently Borrowed', context),
          RecentlyBorrowed(),

          // New Arrival Carousel
          _buildSectionTitle('New Arrival', context),
          NewArrival(),

          // Recommended For You Carousel
          _buildSectionTitle('Recommended For You', context),
          RecommendedForYou()
        ],
      ),
    );
  }
}

Widget _buildSectionTitle(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.bookList);
            },
            child:
                Text("View All", style: Theme.of(context).textTheme.bodySmall))
      ],
    ),
  );
}
