import 'package:get/get.dart';
import 'package:readuslive/models/user_model.dart';

class AppController extends GetxController {
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoggedIn = false.obs;
  final RxBool isFirstTime = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isAuthor = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if user is logged in from local storage
    checkLoginStatus();
    checkFirstTimeUser();
  }

  void checkLoginStatus() {
    // Simulate checking login status
    // In a real app, you would check shared preferences or secure storage
    isLoggedIn.value = false;
  }

  void checkFirstTimeUser() {
    // Simulate checking if it's the first time
    // In a real app, you would check shared preferences
    isFirstTime.value = true;
  }

  void login(String email, String password) {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      // Mock user data
      if (email.contains('author')) {
        isAuthor.value = true;
        currentUser.value = UserModel(
          id: '1',
          name: 'John Author',
          email: email,
          isAuthor: true,
          profileImage: 'https://i.pravatar.cc/150?img=3',
        );
      } else {
        isAuthor.value = false;
        currentUser.value = UserModel(
          id: '2',
          name: 'Jane Reader',
          email: email,
          isAuthor: false,
          profileImage: 'https://i.pravatar.cc/150?img=5',
        );
      }
      
      isLoggedIn.value = true;
      isLoading.value = false;
      Get.offAllNamed('/home');
    });
  }

  void logout() {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      currentUser.value = null;
      isLoggedIn.value = false;
      isLoading.value = false;
      Get.offAllNamed('/login');
    });
  }

  void completeOnboarding() {
    isFirstTime.value = false;
    // In a real app, you would save this to shared preferences
  }
}
