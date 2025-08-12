import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/models/book_model.dart';
import 'package:readuslive/screens/reviews/reviews_controller.dart';
import 'package:readuslive/widgets/review_item.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    final BookModel book = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          // Book info header
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.coverImage,
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'by ${book.authorName}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: book.rating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${book.rating} (${book.reviewCount} reviews)',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // Filter options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('Filter by:'),
                const SizedBox(width: 8),
                Obx(() => DropdownButton<String>(
                  value: controller.selectedFilter.value,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedFilter.value = value;
                      controller.filterReviews();
                    }
                  },
                  items: controller.filterOptions.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                )),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => controller.showAddReviewDialog(),
                  icon: const Icon(Icons.rate_review),
                  label: const Text('Write a Review'),
                ),
              ],
            ),
          ),

          // Reviews list
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredReviews.isEmpty) {
                return const Center(
                  child: Text('No reviews found'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.filteredReviews.length,
                itemBuilder: (context, index) {
                  return ReviewItem(
                    review: controller.filteredReviews[index],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
