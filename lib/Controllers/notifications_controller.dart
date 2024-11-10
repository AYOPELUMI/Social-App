import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectedTabIndex = 0.obs;
  
  List<Map<String, dynamic>> allNotifications = [
    {
      'title': 'Request Accepted!',
      'subtitle': 'You can now come to the library to pick up your book',
      'time': DateTime.now().subtract(Duration(hours: 2)),
      'isRead': true,
    },
    {
      'title': 'Request Declined!',
      'subtitle': 'You have reached your borrow limit',
      'time': DateTime.now().subtract(Duration(hours: 10)),
      'isRead': false,
    },
    {
      'title': 'Request Declined!',
      'subtitle': 'Due to a lot of damaged books',
      'time': DateTime.now().subtract(Duration(days: 1)),
      'isRead': false,
    },
    {
      'title': 'Request Accepted!',
      'subtitle': 'You can now come to the library to pick up your book',
      'time': DateTime.now().subtract(Duration(days: 3)),
      'isRead': true,
    },
  ];

  List<Map<String, dynamic>> get readNotifications => allNotifications
      .where((notification) => notification['isRead'] == true)
      .toList();

  List<Map<String, dynamic>> get unreadNotifications => allNotifications
      .where((notification) => notification['isRead'] == false)
      .toList();

  List<Map<String, dynamic>> getNotificationsByDate(DateTime date) {
    return allNotifications.where((notification) {
      DateTime notificationDate = notification['time'];
      return DateFormat('yyyy-MM-dd').format(notificationDate) == DateFormat('yyyy-MM-dd').format(date);
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
