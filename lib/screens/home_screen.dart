import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/screens/home.dart';
import 'package:social_app/screens/my_books_screen.dart';
import '../Controllers/home_controller.dart';
import '../Utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              HomeScreen(),
              MyBooksScreen(),
              Center(child: Text('Favorites')),
              Center(child: Text('Profile')),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.onTabSelected(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.homeIcon,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.bookIcon,
                ),
                label: 'My Books',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.favouriteIcon,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppIcons.profileIcon,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
