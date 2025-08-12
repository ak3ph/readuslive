import 'package:get/get.dart';
import 'package:readuslive/models/book_model.dart';

class ReaderProfileController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxInt booksRead = 12.obs;
  final RxInt reviewsWritten = 8.obs;
  final RxInt currentStreak = 5.obs;
  final RxInt minutesRead = 320.obs;
  final RxInt booksInProgress = 2.obs;
  
  final RxList<BookModel> favoriteBooks = <BookModel>[].obs;
  final RxList<BookModel> readingHistory = <BookModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }
  
  void fetchUserData() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock favorite books
    favoriteBooks.value = [
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
    ];
    
    // Mock reading history
    readingHistory.value = [
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
      BookModel(
        id: '5',
        title: 'Shadows of the Past',
        authorId: '1',
        authorName: 'John Author',
        coverImage: 'https://picsum.photos/id/36/300/450',
        description: 'A gripping tale of redemption and revenge.',
        rating: 4.3,
        reviewCount: 78,
        categories: ['Fiction', 'Mystery', 'Drama'],
        publishDate: DateTime(2022, 8, 10),
      ),
      BookModel(
        id: '6',
        title: 'The Last Detective',
        authorId: '1',
        authorName: 'John Author',
        coverImage: 'https://picsum.photos/id/48/300/450',
        description: 'The final case of Detective Morgan will test everything he knows.',
        rating: 4.7,
        reviewCount: 95,
        categories: ['Fiction', 'Mystery', 'Crime'],
        publishDate: DateTime(2021, 11, 22),
      ),
    ];
    
    isLoading.value = false;
  }
}
