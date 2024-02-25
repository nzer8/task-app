import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/presentation/resources/app_router.dart';
import 'package:task/presentation/resources/color_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: ColorManger.appBarColor, // Navigation bar
            statusBarColor: ColorManger.appBarColor, // Status bar
          ),
        ),
        fontFamily: 'Almarai',
      ),
      routerConfig: AppRouter.router,
    );
  }
}
