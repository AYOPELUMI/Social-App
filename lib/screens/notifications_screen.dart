import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/notifications_controller.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = Colors.white;
    final inactiveColor = theme.scaffoldBackgroundColor;
    final shadowColor = Colors.grey.shade300;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                final bool isActive = controller.selectedTabIndex.value == index;
                final String label = ['All', 'Read', 'Unread'][index];

                return GestureDetector(
                  onTap: () {
                    controller.tabController.animateTo(index);
                    controller.selectedTabIndex.value = index;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      color: isActive ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: shadowColor,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: isActive ? theme.colorScheme.primary : Colors.grey,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
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
