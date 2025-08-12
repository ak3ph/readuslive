import 'package:get/get.dart';
import 'package:readuslive/models/book_model.dart';
import 'package:readuslive/models/event_model.dart';
import 'package:readuslive/routes/app_pages.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final RxBool isLoading = true.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedCategory = 'All'.obs;
  
  final List<String> categories = [
    'All',
    'Fiction',
    'Non-Fiction',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Biography',
    'History',
    'Self-Help',
  ];
  
  final RxList<BookModel> books = <BookModel>[].obs;
  final RxList<EventModel> events = <EventModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  
  void fetchData() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock books data
    books.value = [
      BookModel(
        id: '1',
        title: 'The Silent Echo',
        authorId: '1',
        authorName: 'John Author',
        coverImage: 'https://picsum.photos/id/24/300/450',
        description: 'A thrilling mystery novel that will keep you on the edge of your seat.',
        rating: 4.5,
        reviewCount: 120,
        categories: ['Fiction', 'Mystery', 'Thriller'],
        publishDate: DateTime(2023, 5, 15),
      ),
      BookModel(
        id: '2',
        title: 'Beyond the Horizon',
        authorId: '2',
        authorName: 'Sarah Writer',
        coverImage: 'https://picsum.photos/id/42/300/450',
        description: 'An epic science fiction adventure across galaxies.',
        rating: 4.8,
        reviewCount: 85,
        categories: ['Fiction', 'Sci-Fi', 'Adventure'],
        publishDate: DateTime(2023, 3, 10),
      ),
      BookModel(
        id: '3',
        title: 'Whispers in the Wind',
        authorId: '3',
        authorName: 'Emily Wordsmith',
        coverImage: 'https://picsum.photos/id/96/300/450',
        description: 'A touching romance that spans decades.',
        rating: 4.2,
        reviewCount: 67,
        categories: ['Fiction', 'Romance', 'Drama'],
        publishDate: DateTime(2023, 1, 22),
      ),
      BookModel(
        id: '4',
        title: 'The Art of Focus',
        authorId: '4',
        authorName: 'David Mindful',
        coverImage: 'https://picsum.photos/id/106/300/450',
        description: 'Learn how to master your attention in a distracted world.',
        rating: 4.6,
        reviewCount: 92,
        categories: ['Non-Fiction', 'Self-Help', 'Psychology'],
        publishDate: DateTime(2022, 11, 5),
      ),
    ];
    
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
    ];
    
    isLoading.value = false;
  }
  
  void changePage(int index) {
    currentIndex.value = index;
    
    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        // Navigate to search/explore
        Get.toNamed(Routes.HOME); // Replace with actual route when available
        break;
      case 2:
        // Navigate to events
        Get.toNamed(Routes.EVENT_BOOKING);
        break;
      case 3:
        // Navigate to profile
        final appController = Get.find<AppController>();
        if (appController.isAuthor.value) {
          Get.toNamed(Routes.AUTHOR_PROFILE);
        } else {
          Get.toNamed(Routes.READER_PROFILE);
        }
        break;
    }
  }
  
  void onSearchChanged(String query) {
    searchQuery.value = query;
    // In a real app, you would filter the books based on the query
  }
  
  void selectCategory(String category) {
    selectedCategory.value = category;
    // In a real app, you would filter the books based on the category
  }
}
