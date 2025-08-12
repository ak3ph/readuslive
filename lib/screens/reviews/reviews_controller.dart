import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/models/review_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  final RxList<ReviewModel> filteredReviews = <ReviewModel>[].obs;
  
  final RxString selectedFilter = 'All Reviews'.obs;
  final List<String> filterOptions = [
    'All Reviews',
    'Highest Rated',
    'Lowest Rated',
    'Most Recent',
    'With Author Response',
  ];
  
  final TextEditingController reviewController = TextEditingController();
  final RxDouble newReviewRating = 0.0.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }
  
  void fetchReviews() async {
    isLoading.value = true;
    
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
      ReviewModel(
        id: '4',
        bookId: '1',
        userId: '5',
        userName: 'Tom Critic',
        userImage: 'https://i.pravatar.cc/150?img=15',
        rating: 3.0,
        comment: 'Decent story but predictable in parts. The middle section dragged a bit.',
        createdAt: DateTime(2023, 5, 20),
        authorResponse: 'Thanks for your honest review! I\'ll keep this in mind for my next book.',
        authorResponseDate: DateTime(2023, 5, 22),
      ),
      ReviewModel(
        id: '5',
        bookId: '1',
        userId: '6',
        userName: 'Lisa Enthusiast',
        userImage: 'https://i.pravatar.cc/150?img=20',
        rating: 5.0,
        comment: 'I couldn\'t put it down! Read it in one sitting. The characters felt so real.',
        createdAt: DateTime(2023, 5, 15),
      ),
    ];
    
    filteredReviews.value = reviews;
    isLoading.value = false;
  }
  
  void filterReviews() {
    switch (selectedFilter.value) {
      case 'Highest Rated':
        filteredReviews.value = List.from(reviews)
          ..sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Lowest Rated':
        filteredReviews.value = List.from(reviews)
          ..sort((a, b) => a.rating.compareTo(b.rating));
        break;
      case 'Most Recent':
        filteredReviews.value = List.from(reviews)
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'With Author Response':
        filteredReviews.value = reviews
            .where((review) => review.authorResponse != null)
            .toList();
        break;
      default:
        filteredReviews.value = reviews;
    }
  }
  
  void showAddReviewDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Write a Review'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Rate this book:'),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                newReviewRating.value = rating;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reviewController,
              decoration: const InputDecoration(
                hintText: 'Share your thoughts about this book...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: submitReview,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
  
  void submitReview() {
    if (newReviewRating.value == 0) {
      Get.snackbar(
        'Error',
        'Please rate the book before submitting',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    if (reviewController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please write a review before submitting',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    
    // In a real app, you would send this to an API
    final newReview = ReviewModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      bookId: '1',
      userId: '2',
      userName: 'Jane Reader',
      userImage: 'https://i.pravatar.cc/150?img=5',
      rating: newReviewRating.value,
      comment: reviewController.text,
      createdAt: DateTime.now(),
    );
    
    reviews.add(newReview);
    filterReviews();
    
    reviewController.clear();
    newReviewRating.value = 0;
    
    Get.back();
    Get.snackbar(
      'Success',
      'Your review has been submitted',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
  
  @override
  void onClose() {
    reviewController.dispose();
    super.onClose();
  }
}
