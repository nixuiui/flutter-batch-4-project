import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/blocs/auth/auth_cubit.dart';
import 'package:flutter_batch_4_project/consts/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if(mounted) {
      final isLoggedIn = context.read<AuthCubit>().isLoggedIn();
      if(isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen'
        ),
      ),
    );
  }
}