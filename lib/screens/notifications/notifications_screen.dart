import 'package:flutter/material.dart';

import '../../models/app_notification.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_app_bar.dart';
import '../../widgets/app_feedback.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    required this.notifications,
    required this.onRead,
    super.key,
  });
  final List<AppNotification> notifications;
  final ValueChanged<int> onRead;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KaamSetuAppBar(title: 'Notifications'),
      body: notifications.isEmpty
          ? const AppStateView(
              icon: Icons.notifications_none,
              title: 'You are all caught up',
              message: 'Job and application updates will appear here.',
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: notifications.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return ListTile(
                  onTap: () => onRead(index),
                  leading: CircleAvatar(
                    backgroundColor: item.isRead
                        ? Colors.grey.shade200
                        : Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      Icons.notifications,
                      color: item.isRead ? AppColors.muted : AppColors.primary,
                    ),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: item.isRead
                          ? FontWeight.w500
                          : FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(item.message),
                );
              },
            ),
    );
  }
}
