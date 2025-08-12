import 'package:get/get.dart';
import 'package:readuslive/models/notification_model.dart';
import 'package:readuslive/routes/app_pages.dart';

class NotificationsController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<NotificationModel> notifications = <NotificationModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }
  
  void fetchNotifications() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock notifications data
    notifications.value = [
      NotificationModel(
        id: '1',
        title: 'New Live Event',
        message: 'John Author is going live with "Mystery Writing Workshop" in 30 minutes.',
        type: 'event',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        data: {
          'eventId': '1',
        },
      ),
      NotificationModel(
        id: '2',
        title: 'New Book Release',
        message: 'Sarah Writer just published a new book: "Beyond the Horizon".',
        type: 'book',
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        data: {
          'bookId': '2',
        },
      ),
      NotificationModel(
        id: '3',
        title: 'Author Started Following You',
        message: 'Emily Wordsmith is now following you.',
        type: 'author',
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        data: {
          'authorId': '3',
        },
      ),
      NotificationModel(
        id: '4',
        title: 'Your Review Got a Response',
        message: 'John Author responded to your review on "The Silent Echo".',
        type: 'book',
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        data: {
          'bookId': '1',
          'reviewId': '2',
        },
      ),
      NotificationModel(
        id: '5',
        title: 'Welcome to ReadUsLive',
        message: 'Thank you for joining our community of readers and authors!',
        type: 'system',
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        data: {},
      ),
    ];
    
    isLoading.value = false;
  }
  
  void onNotificationTap(NotificationModel notification) {
    // Mark as read
    final index = notifications.indexWhere((n) => n.id == notification.id);
    if (index != -1) {
      notifications[index] = notifications[index].copyWith(isRead: true);
    }
    
    // Navigate based on notification type
    switch (notification.type) {
      case 'event':
        final eventId = notification.data['eventId'];
        Get.toNamed(Routes.EVENT_BOOKING, arguments: eventId);
        break;
      case 'book':
        final bookId = notification.data['bookId'];
        Get.toNamed(Routes.BOOK_DETAILS, arguments: bookId);
        break;
      case 'author':
        final authorId = notification.data['authorId'];
        Get.toNamed(Routes.AUTHOR_PROFILE, arguments: authorId);
        break;
      default:
        // Do nothing for system notifications
        break;
    }
  }
  
  void markAllAsRead() {
    final updatedNotifications = notifications.map((notification) {
      return notification.copyWith(isRead: true);
    }).toList();
    
    notifications.value = updatedNotifications;
    
    Get.snackbar(
      'Notifications',
      'All notifications marked as read',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void deleteNotification(String id) {
    notifications.removeWhere((notification) => notification.id == id);
  }
}
