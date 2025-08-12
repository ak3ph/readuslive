import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/controllers/app_controller.dart';
import 'package:readuslive/screens/reader_profile/reader_profile_controller.dart';
import 'package:readuslive/widgets/book_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReaderProfileScreen extends StatelessWidget {
  const ReaderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReaderProfileController());
    final appController = Get.find<AppController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Navigate to settings
              Get.snackbar(
                'Settings',
                'Settings screen will be implemented here',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = appController.currentUser.value;
        if (user == null) {
          return const Center(child: Text('User not found'));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(user.profileImage),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn(context, controller.booksRead.toString(), 'Books Read'),
                        _buildStatColumn(context, controller.favoriteBooks.length.toString(), 'Favorites'),
                        _buildStatColumn(context, controller.reviewsWritten.toString(), 'Reviews'),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Reading activity
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reading Activity',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActivityItem(context, '${controller.currentStreak} days', 'Current Streak'),
                          _buildActivityItem(context, '${controller.minutesRead} mins', 'This Week'),
                          _buildActivityItem(context, controller.booksInProgress.toString(), 'In Progress'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Favorite books
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorite Books',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 16),
                    controller.favoriteBooks.isEmpty
                        ? const Center(
                            child: Text('No favorite books yet'),
                          )
                        : SizedBox(
                            height: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.favoriteBooks.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: BookCard(
                                      book: controller.favoriteBooks[index],
                                      onTap: () => Get.toNamed(
                                        '/book-details',
                                        arguments: controller.favoriteBooks[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),

              // Reading history
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reading History',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 16),
                    controller.readingHistory.isEmpty
                        ? const Center(
                            child: Text('No reading history yet'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.readingHistory.length,
                            itemBuilder: (context, index) {
                              final book = controller.readingHistory[index];
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: CachedNetworkImage(
                                    imageUrl: book.coverImage,
                                    width: 40,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(book.title),
                                subtitle: Text(book.authorName),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () => Get.toNamed(
                                  '/book-details',
                                  arguments: book,
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Logout button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => appController.logout(),
                    child: const Text('Logout'),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatColumn(BuildContext context, String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildActivityItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
