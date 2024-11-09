import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/notifications_controller.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        bottom: TabBar(
          controller: controller.tabController,
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: controller.tabController.index == 0
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: controller.tabController.index == 0
                      ? [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]
                      : [],
                ),
                child: Text('All'),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: controller.tabController.index == 1
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: controller.tabController.index == 1
                      ? [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]
                      : [],
                ),
                child: Text('Read'),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: controller.tabController.index == 2
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: controller.tabController.index == 2
                      ? [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]
                      : [],
                ),
                child: Text('Unread'),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          NotificationList(notifications: controller.allNotifications),
          NotificationList(notifications: controller.readNotifications),
          NotificationList(notifications: controller.unreadNotifications),
        ],
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(
          title: notification['title'],
          subtitle: notification['subtitle'],
          time: notification['time'],
          isRead: notification['isRead'],
        );
      },
    );
  }
}
