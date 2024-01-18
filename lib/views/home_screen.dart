import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_todo/views/login_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
           const  Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
               Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => BlocProvider(
                    create: (context) => LoginBloc(),
                    child: const LoginScreen(),
                  )),
          (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                minimumSize: const Size(double.infinity,
                    50), // double.infinity is the width and 50 is the height
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
