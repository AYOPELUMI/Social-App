import 'package:get/get.dart';

class HomeController extends GetxController {
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

  void onTabSelected(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/home');
        break;
      case 1:
        Get.offNamed('/my_books');
        break;
      case 2:
        Get.offNamed('/favorites');
        break;
      case 3:
        Get.offNamed('/profile');
        break;
      default:
        break;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
