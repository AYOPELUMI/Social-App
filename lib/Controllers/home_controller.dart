import 'package:get/get.dart';

class HomeController extends GetxController {
  // RxInt to observe and react to changes in the selected index
  var selectedIndex = 0.obs;

  List<String> recentlyBorrowed = [
    'Book 1',
    'Book 2',
    'Book 3',
  ];

  List<String> newArrival = [
    'Book 4',
    'Book 5',
    'Book 6',
  ];

  List<String> recommendedForYou = [
    'Book 7',
    'Book 8',
    'Book 9',
  ];

  // Method to handle navigation based on the selected index
  void onTabSelected(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/home'); // Replace with your actual route name
        break;
      case 1:
        Get.offNamed('/my_books'); // Replace with your actual route name
        break;
      case 2:
        Get.offNamed('/favorites'); // Replace with your actual route name
        break;
      case 3:
        Get.offNamed('/profile'); // Replace with your actual route name
        break;
      default:
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // You can load data from an API or database here if needed.
  }
}
