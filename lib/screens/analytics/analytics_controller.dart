import 'package:get/get.dart';
import 'package:readuslive/models/review_model.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxString timeRange = 'week'.obs;
  
  final RxInt totalReaders = 1250.obs;
  final RxInt totalBooks = 3.obs;
  final RxInt eventsHosted = 5.obs;
  final RxDouble averageRating = 4.5.obs;
  
  final RxList<FlSpot> readerEngagementSpots = <FlSpot>[].obs;
  final RxList<BarChartGroupData> bookPerformanceGroups = <BarChartGroupData>[].obs;
  final RxList<ReviewModel> recentReviews = <ReviewModel>[].obs;
  
  List<FlSpot> get readerEngagementData => readerEngagementSpots;
  List<BarChartGroupData> get bookPerformanceData => bookPerformanceGroups;
  
  @override
  void onInit() {
    super.onInit();
    fetchAnalyticsData();
  }
  
  void fetchAnalyticsData() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Mock reader engagement data
    if (timeRange.value == 'week') {
      readerEngagementSpots.value = [
        const FlSpot(0, 10),
        const FlSpot(1, 15),
        const FlSpot(2, 13),
        const FlSpot(3, 17),
        const FlSpot(4, 20),
        const FlSpot(5, 25),
        const FlSpot(6, 22),
      ];
    } else if (timeRange.value == 'month') {
      readerEngagementSpots.value = [
        const FlSpot(0, 50),
        const FlSpot(1, 70),
        const FlSpot(2, 85),
        const FlSpot(3, 95),
      ];
    } else {
      readerEngagementSpots.value = [
        const FlSpot(0, 200),
        const FlSpot(1, 250),
        const FlSpot(2, 300),
        const FlSpot(3, 280),
        const FlSpot(4, 320),
        const FlSpot(5, 350),
      ];
    }
    
    // Mock book performance data
    bookPerformanceGroups.value = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 4.5,
            color: Colors.blue,
            width: 15,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 4.3,
            color: Colors.blue,
            width: 15,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 4.7,
            color: Colors.blue,
            width: 15,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
    ];
    
    // Mock recent reviews
    recentReviews.value = [
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
    
    isLoading.value = false;
  }
  
  void changeTimeRange(String range) {
    timeRange.value = range;
    fetchAnalyticsData();
  }
}
