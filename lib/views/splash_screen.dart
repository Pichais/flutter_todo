import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_todo/views/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => BlocProvider(
                    create: (context) => LoginBloc(),
                    child: const LoginScreen(),
                  )),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('images/lottie/A2.json', height: 300.h),
            const Text(
              'WELCOME TO TODO APP',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Lottie.asset('images/lottie/loading.json', height: 100.h),
          ],
        ),
      ),
    );
  }
}
