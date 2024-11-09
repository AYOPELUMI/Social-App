import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:social_app/widgets/new_arrival.dart';
import 'package:social_app/widgets/recently_borrowed.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final primaryColor = theme.colorScheme.primary;

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              // Add your main screens here
              // e.g., HomeScreen(), MyBooksScreen(), FavoritesScreen(), ProfileScreen()
              Center(child: Text('Home')),
              Center(child: Text('My Books')),
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
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'My Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
