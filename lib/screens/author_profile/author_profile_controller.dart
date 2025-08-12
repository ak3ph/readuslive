import 'package:get/get.dart';
import 'package:readuslive/controllers/app_controller.dart';
import 'package:readuslive/models/user_model.dart';
import 'package:readuslive/models/book_model.dart';
import 'package:readuslive/models/event_model.dart';

class AuthorProfileController extends GetxController {
  final RxBool isLoading = true.obs;
  final Rx<UserModel> author = UserModel(
    id: '1',
    name: 'John Author',
    email: 'john@author.com',
    isAuthor: true,
    profileImage: 'https://i.pravatar.cc/150?img=3',
    bio: 'Bestselling author of mystery and thriller novels. I love creating complex characters and twisty plots that keep readers guessing until the last page.',
    followers: 1250,
    following: 45,
  ).obs;
  
  final RxList<BookModel> books = <BookModel>[].obs;
  final RxList<EventModel> events = <EventModel>[].obs;
  final RxBool isFollowing = false.obs;
  final RxBool isAuthorView = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    checkIfAuthorView();
    fetchAuthorData();
  }
  
  void checkIfAuthorView() {
    final appController = Get.find<AppController>();
    isAuthorView.value = appController.isAuthor.value;
  }
  
  void fetchAuthorData() async {
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
    ];
    
    isLoading.value = false;
  }
  
  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
    
    if (isFollowing.value) {
      author.update((val) {