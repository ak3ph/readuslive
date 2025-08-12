import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/controllers/app_controller.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;
  final RxBool isAuthor = false.obs;
  
  final AppController appController = Get.find<AppController>();
  
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
  
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
  
  void toggleUserType() {
    isAuthor.value = !isAuthor.value;
  }
  
  void login() {
    if (loginFormKey.currentState!.validate()) {
      appController.login(emailController.text, passwordController.text);
    }
  }
  
  void signup() {
    if (signupFormKey.currentState!.validate()) {
      // In a real app, you would call an API to register the user
      // For now, we'll just simulate success and redirect to login
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
      Get.offAllNamed('/login');
    }
  }
  
  void loginWithGoogle() {
    // Implement Google login
    Get.snackbar(
      'Google Login',
      'This feature is not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void loginWithApple() {
    // Implement Apple login
    Get.snackbar(
      'Apple Login',
      'This feature is not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void loginWithFacebook() {
    // Implement Facebook login
    Get.snackbar(
      'Facebook Login',
      'This feature is not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void forgotPassword() {
    // Implement forgot password
    Get.snackbar(
      'Forgot Password',
      'This feature is not implemented yet',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
