import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme colors and text styles
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black; // Fallback to black if null
    final primaryColor = theme.colorScheme.primary; // Use the primary color from the theme

    return SingleChildScrollView(
      child: Column(
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
                    backgroundColor: primaryColor, // Use the primary color from the theme
                    child: ClipOval(
                      child: Image.asset(
                        'assets/avatar.png', // Replace with your image asset
                        fit: BoxFit.cover,
                        width: 39,
                        height: 39,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 50,
                            color: theme.iconTheme.color, // Use the theme's icon color
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Hi, Ayodeji",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0, // Use a constant or modify for your app's size
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/notificationsScreen'), // Replace with your route
                child: Icon(
                  Icons.notifications,
                  color: primaryColor, // Use the primary color from the theme
                  fill: 1.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
