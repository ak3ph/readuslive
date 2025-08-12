import 'package:get/get.dart';
import 'package:readuslive/screens/splash/splash_screen.dart';
import 'package:readuslive/screens/onboarding/onboarding_screen.dart';
import 'package:readuslive/screens/auth/login_screen.dart';
import 'package:readuslive/screens/auth/signup_screen.dart';
import 'package:readuslive/screens/home/home_screen.dart';
import 'package:readuslive/screens/book_details/book_details_screen.dart';
import 'package:readuslive/screens/author_profile/author_profile_screen.dart';
import 'package:readuslive/screens/reader_profile/reader_profile_screen.dart';
import 'package:readuslive/screens/event_booking/event_booking_screen.dart';
import 'package:readuslive/screens/reviews/reviews_screen.dart';
import 'package:readuslive/screens/notifications/notifications_screen.dart';
import 'package:readuslive/screens/analytics/analytics_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.BOOK_DETAILS,
      page: () => const BookDetailsScreen(),
    ),
    GetPage(
      name: Routes.AUTHOR_PROFILE,
      page: () => const AuthorProfileScreen(),
    ),
    GetPage(
      name: Routes.READER_PROFILE,
      page: () => const ReaderProfileScreen(),
    ),
    GetPage(
      name: Routes.EVENT_BOOKING,
      page: () => const EventBookingScreen(),
    ),
    GetPage(
      name: Routes.REVIEWS,
      page: () => const ReviewsScreen(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: Routes.ANALYTICS,
      page: () => const AnalyticsScreen(),
    ),
  ];
}
