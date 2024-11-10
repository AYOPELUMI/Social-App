import 'package:get/get.dart';
import 'package:social_app/data/book_model.dart';
import 'package:social_app/widgets/new_arrival.dart';
import 'books_list_controller.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  final BookController controller = Get.put(BookController());

  List<String> recentlyBorrowed = [
    'Book 1',
    'Book 2',
    'Book 3',
  ];

  var newArrival = <Book>[].obs; // Reactive list for new arrivals
  var recommendedForYou = <Book>[].obs; // Reactive list for recommendations

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

    // Initialize the lists with the data from the BookController
    print("in the home controller ${controller.books}");
    _updateLists();

    // Listen for updates in the books list and update the lists accordingly
    ever(
        controller.books,
        (_) =>
            _updateLists()); // This will be called every time the books list is updated
  }

  // Method to update newArrival and recommendedForYou lists
  void _updateLists() {
    newArrival.assignAll(controller.books.value.take(5).toList());
    recommendedForYou.assignAll(controller.books.value.take(10).toList());
  }
}
