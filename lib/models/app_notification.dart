class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String message;
  final bool isRead;

  AppNotification copyWith({bool? isRead}) => AppNotification(
    id: id,
    title: title,
    message: message,
    isRead: isRead ?? this.isRead,
  );
}
