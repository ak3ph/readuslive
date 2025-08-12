import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readuslive/routes/app_pages.dart';
import 'package:readuslive/theme/app_theme.dart';
import 'package:readuslive/controllers/app_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ReadUsLive',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
