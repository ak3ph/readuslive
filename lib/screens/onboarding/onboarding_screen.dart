import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/controllers/app_controller.dart';
import 'package:readuslive/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readuslive/screens/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final appController = Get.find<AppController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  OnboardingPage(
                    image: 'images/onboarding1.png',
                    title: 'Discover New Books',
                    description: 'Find your next favorite read from thousands of titles across genres.',
                  ),
                  OnboardingPage(
                    image: 'images/onboarding2.png',
                    title: 'Connect with Authors',
                    description: 'Join live events and interact directly with your favorite authors.',
                  ),
                  OnboardingPage(
                    image: 'images/onboarding3.png',
                    title: 'Share Your Thoughts',
                    description: 'Write reviews, rate books, and engage with a community of readers.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xFF3498DB),
                      dotColor: Color(0xFFD1D1D1),
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Obx(() => controller.currentPage.value < 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                appController.completeOnboarding();
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: const Text('Skip'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Text('Next'),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              appController.completeOnboarding();
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: const Text('Get Started'),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
