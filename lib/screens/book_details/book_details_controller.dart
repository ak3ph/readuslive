import 'package:get/get.dart';
import 'package:readuslive/models/book_model.dart';
import 'package:readuslive/models/review_model.dart';

class BookDetailsController extends GetxController {
  final RxBool isFavorite = false.obs;
  final RxBool isLoadingReviews = true.obs;
  final RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  
  // Dummy book for preview purposes
  final BookModel dummyBook = BookModel(
    id: '1',
    title: 'The Silent Echo',
    authorId: '1',
    authorName: 'John Author',
    coverImage: 'https://picsum.photos/id/24/300/450',
    description: 'A thrilling mystery novel that will keep you on the edge of your seat. Follow detective Alex Morgan as he unravels a complex web of deceit and danger in the quiet town of Millfield. When a series of mysterious disappearances shakes the community, Alex must confront his own past while racing against time to find the truth before more lives are lost.',
    rating: 4.5,
    reviewCount: 120,
    categories: ['Fiction', 'Mystery', 'Thriller'],
    publishDate: DateTime(2023, 5, 15),
  );
  
  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }
  
  void fetchReviews() async {
    isLoadingReviews.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock reviews data
    reviews.value = [
      ReviewModel(
        id: '1',
        bookId: '1',
        userId: '2',
        userName: 'Jane Reader',
        userImage: 'https://i.pravatar.cc/150?img=5',
        rating: 5.0,
        comment: 'Absolutely loved this book! The plot twists kept me guessing until the very end.',
        createdAt: DateTime(2023, 6, 10),
      ),
      ReviewModel(
        id: '2',
        bookId: '1',
        userId: '3',
        userName: 'Mike Bookworm',
        userImage: 'https://i.pravatar.cc/150?img=12',
        rating: 4.0,
        comment: 'Great character development and pacing. The ending felt a bit rushed though.',
        createdAt: DateTime(2023, 6, 5),
        authorResponse: 'Thank you for your feedback! I appreciate your thoughts on the ending.',
        authorResponseDate: DateTime(2023, 6, 7),
      ),
      ReviewModel(
        id: '3',
        bookId: '1',
        userId: '4',
        userName: 'Sarah Avid',
        userImage: 'https://i.pravatar.cc/150?img=9',
        rating: 4.5,
        comment: 'One of the best mysteries I\'ve read this year. Can\'t wait for the sequel!',
        createdAt: DateTime(2023, 5, 28),
      ),
    ];
    
    isLoadingReviews.value = false;
  }
  
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    
    Get.snackbar(
      isFavorite.value ? 'Added to Favorites' : 'Removed from Favorites',
      isFavorite.value ? 'This book has been added to your favorites.' : 'This book has been removed from your favorites.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void shareBook() {
    // Implement share functionality
    Get.snackbar(
      'Share',
      'Sharing functionality will be implemented here.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void addToWishlist() {
    // Implement add to wishlist functionality
    Get.snackbar(
      'Added to Wishlist',
      'This book has been added to your wishlist.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void readNow() {
    // Implement read now functionality
    Get.snackbar(
      'Read Now',
      'Opening book reader...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
