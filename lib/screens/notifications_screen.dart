import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/notifications_controller.dart';
import '../widgets/notification_card.dart';
import 'package:intl/intl.dart';

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
        title: Text(
          'Notification',
          textAlign: TextAlign.center,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Obx(() {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  final bool isActive =
                      controller.selectedTabIndex.value == index;
                  final String label = ['All', 'Read', 'Unread'][index];

                  return GestureDetector(
                    onTap: () {
                      controller.tabController.animateTo(index);
                      controller.selectedTabIndex.value = index;
                    },
                    child: Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          color: isActive ? activeColor : inactiveColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                    color: shadowColor,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: isActive
                                ? theme.colorScheme.primary
                                : Colors.grey,
                            fontWeight:
                                isActive ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          _buildNotificationList(controller.allNotifications),
          _buildNotificationList(controller.readNotifications),
          _buildNotificationList(controller.unreadNotifications),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return Center(child: Text('No notifications'));
    }

    return ListView(
      children: [
        _buildSection('Today', notifications, DateTime.now()),
        _buildSection('Yesterday', notifications,
            DateTime.now().subtract(Duration(days: 1))),
        _buildSection(
            'Older', notifications, DateTime.now().subtract(Duration(days: 2))),
      ],
    );
  }

  Widget _buildSection(String sectionTitle,
      List<Map<String, dynamic>> notifications, DateTime date) {
    List<Map<String, dynamic>> filteredNotifications = notifications
        .where((n) =>
            DateFormat('yyyy-MM-dd').format(n['time']) ==
            DateFormat('yyyy-MM-dd').format(date))
        .toList();

    if (filteredNotifications.isEmpty) return Container();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 66),
            child: Text(
              sectionTitle,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ...filteredNotifications.map((notification) {
            return NotificationCard(
              title: notification['title'],
              subtitle: notification['subtitle'],
              time: notification['time'],
              isRead: notification['isRead'],
            );
          }).toList(),
        ],
      ),
    );
  }
}
