import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventBookingController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<EventModel> events = <EventModel>[].obs;
  
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }
  
  void fetchEvents() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock events data
    events.value = [
      EventModel(
        id: '1',
        title: 'Mystery Writing Workshop',
        authorId: '1',
        authorName: 'John Author',
        authorImage: 'https://i.pravatar.cc/150?img=3',
        eventDate: DateTime.now().add(const Duration(days: 2)),
        description: 'Learn the secrets of writing compelling mystery novels.',
        attendeeCount: 45,
        isLive: true,
      ),
      EventModel(
        id: '2',
        title: 'Book Launch: Beyond the Horizon',
        authorId: '2',
        authorName: 'Sarah Writer',
        authorImage: 'https://i.pravatar.cc/150?img=5',
        eventDate: DateTime.now().add(const Duration(days: 5)),
        description: 'Join us for the exciting launch of this sci-fi masterpiece.',
        attendeeCount: 120,
        isLive: false,
        bookId: '2',
        bookTitle: 'Beyond the Horizon',
      ),
      EventModel(
        id: '3',
        title: 'Character Development Masterclass',
        authorId: '3',
        authorName: 'Emily Wordsmith',
        authorImage: 'https://i.pravatar.cc/150?img=8',
        eventDate: DateTime.now().add(const Duration(days: 7)),
        description: 'Create memorable characters that readers will love.',
        attendeeCount: 78,
        isLive: false,
      ),
      EventModel(
        id: '4',
        title: 'Book Signing: The Silent Echo',
        authorId: '1',
        authorName: 'John Author',
        authorImage: 'https://i.pravatar.cc/150?img=3',
        eventDate: DateTime.now().add(const Duration(days: 10)),
        description: 'Meet the author and get your copy signed!',
        attendeeCount: 120,
        isLive: false,
        bookId: '1',
        bookTitle: 'The Silent Echo',
      ),
      EventModel(
        id: '5',
        title: 'Writing for Young Adults',
        authorId: '5',
        authorName: 'Alex Young',
        authorImage: 'https://i.pravatar.cc/150?img=11',
        eventDate: DateTime.now().add(const Duration(days: 14)),
        description: 'Learn how to connect with the young adult audience through your writing.',
        attendeeCount: 65,
        isLive: false,
      ),
    ];
    
    isLoading.value = false;
  }
  
  List<EventModel> get filteredEvents {
    if (selectedDay.value == null) {
      return events;
    }
    
    return events.where((event) {
      return isSameDay(event.eventDate, selectedDay.value);
    }).toList();
  }
  
  List<EventModel> getEventsForDay(DateTime day) {
    return events.where((event) => isSameDay(event.eventDate, day)).toList();
  }
  
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
  
  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }
  
  void clearSelection() {
    selectedDay.value = null;
  }
  
  void joinEvent(EventModel event) {
    if (event.isLive) {
      // Navigate to live event screen
      Get.snackbar(
        'Joining Live Event',
        'You are joining ${event.title}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Register for event
      Get.snackbar(
        'Registration Successful',
        'You have registered for ${event.title}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
