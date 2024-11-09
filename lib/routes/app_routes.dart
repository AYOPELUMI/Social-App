import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/my_books_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String notifications = '/notifications';
  static const String myBooks = '/my-books';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: notifications, page: () => NotificationsScreen()),
    GetPage(name: myBooks, page: () => MyBooksScreen()),
  ];
}
