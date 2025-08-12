import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/screens/author_profile/author_profile_controller.dart';
import 'package:readuslive/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:readuslive/widgets/book_card.dart';
import 'package:readuslive/widgets/event_card.dart';

class AuthorProfileScreen extends StatelessWidget {
  const AuthorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthorProfileController());
    final String? authorId = Get.arguments;

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        final author = controller.author.value;
        
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.shade800,
                        Colors.blue.shade500,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(author.profileImage),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          author.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
              actions: [
                Obx(() => IconButton(
                  icon: Icon(
                    controller.isFollowing.value
                        ? Icons.person_remove
                        : Icons.person_add,
                  ),
                  onPressed: controller.toggleFollow,
                )),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn(context, author.followers.toString(), 'Followers'),
                        _buildStatColumn(context, controller.books.length.toString(), 'Books'),
                        _buildStatColumn(context, controller.events.length.toString(), 'Events'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'About',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      author.bio ?? 'No bio available',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upcoming Events',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.EVENT_BOOKING),
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: controller.events.isEmpty
                    ? const Center(child: Text('No upcoming events'))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: controller.events.length,
                        itemBuilder: (context, index) {
                          final event = controller.events[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: EventCard(
                              event: event,
                              onTap: () => Get.toNamed(
                                Routes.EVENT_BOOKING,
                                arguments: event,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Books',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final book = controller.books[index];
                    return BookCard(
                      book: book,
                      onTap: () => Get.toNamed(
                        Routes.BOOK_DETAILS,
                        arguments: book,
                      ),
                    );
                  },
                  childCount: controller.books.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.isAuthorView.value) {
          return FloatingActionButton(
            onPressed: () => Get.toNamed(Routes.ANALYTICS),
            child: const Icon(Icons.analytics),
          );
        }
        return const SizedBox.shrink();
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
}
