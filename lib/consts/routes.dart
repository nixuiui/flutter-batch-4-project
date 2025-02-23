import 'package:flutter_batch_4_project/pages/home/home_page.dart';
import 'package:flutter_batch_4_project/pages/login_page.dart';
import 'package:flutter_batch_4_project/pages/order_summary_screen.dart';
import 'package:flutter_batch_4_project/pages/splash_screen.dart';

class AppRoutes {
  static String get splash => "/splash";
  static String get home => "/home";
  static String get login => "/login";
  static String get orderSummaryScreen => "/order-summary-screen";
}

final routes = {
  AppRoutes.splash: (context) => const SplashScreen(),
  AppRoutes.home: (context) => const HomePage(),
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.orderSummaryScreen: (context) => const OrderSummaryScreen(),
};