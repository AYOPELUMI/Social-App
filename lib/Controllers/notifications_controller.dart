import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotificationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  List<Map<String, dynamic>> allNotifications = [
    {
      'title': 'Request Accepted!',
      'subtitle': 'You can now come to the library to pick up your book',
      'time': '2 hours ago',
      'isRead': true,
    },
    {
      'title': 'Request Declined!',
      'subtitle': 'You have reached your borrow limit',
      'time': '10 hours ago',
      'isRead': false,
    },
    {
      'title': 'Request Declined!',
      'subtitle': 'Due to a lot of damaged books',
      'time': '1 day ago',
      'isRead': false,
    },
    // Add more notifications as needed
  ];

  List<Map<String, dynamic>> get readNotifications => allNotifications
      .where((notification) => notification['isRead'] == true)
      .toList();

  List<Map<String, dynamic>> get unreadNotifications => allNotifications
      .where((notification) => notification['isRead'] == false)
      .toList();

  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(length: 3, vsync: this); // Initialize TabController
  }

  @override
  void onClose() {
    tabController.dispose(); // Dispose of the TabController
    super.onClose();
  }
}
