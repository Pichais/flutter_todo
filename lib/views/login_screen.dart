import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_todo/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_todo/views/home_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onKeyPress(BuildContext context, String value) {
    context.read<LoginBloc>().add(AddPinCode(pinCode: value));
  }

  Widget _buildNumberButton({
    required BuildContext context,
    required String number,
  }) {
    return Expanded(
      child: ElevatedButton(
        child: Text(number, style: TextStyle(fontSize: 20.sp)),
        onPressed: () => _onKeyPress(context, number),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.pinCode.length == 6) {
          if (state.pinCode == '120542') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) =>  BlocProvider(
                        create: (context) => HomeBloc(),
                        child: const HomeScreen(),
                      )),
            );
          } else {
            const snackBar = SnackBar(
              content: Text('PIN is was worng please try gain !!!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('images/lottie/A2.json',
                        height: 200.h), // Your Lottie animation
                    const SizedBox(height: 20),
                    const Text('Enter your PIN',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('•' * state.pinCode.length,
                                    style: const TextStyle(fontSize: 30)),
                                const SizedBox(height: 40),
                                Row(
                                  children: <Widget>[
                                    _buildNumberButton(
                                        context: context, number: '1'),
                                    _buildNumberButton(
                                        context: context, number: '2'),
                                    _buildNumberButton(
                                        context: context, number: '3'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    _buildNumberButton(
                                        context: context, number: '4'),
                                    _buildNumberButton(
                                        context: context, number: '5'),
                                    _buildNumberButton(
                                        context: context, number: '6'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    _buildNumberButton(
                                        context: context, number: '7'),
                                    _buildNumberButton(
                                        context: context, number: '8'),
                                    _buildNumberButton(
                                        context: context, number: '9'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    _buildNumberButton(
                                        context: context, number: '0'),
                                    Expanded(
                                      child: ElevatedButton(
                                        child: const Text('Clear',
                                            style: TextStyle(fontSize: 20)),
                                        onPressed: () =>
                                            _onKeyPress(context, 'clear'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.of(context).pushReplacement(
                          //         MaterialPageRoute(
                          //             builder: (BuildContext context) =>
                          //                 const HomeScreen()));
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.grey.shade100,
                          //     minimumSize: const Size(double.infinity, 50),
                          //   ),
                          //   child: const Text('Login'),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
// 
//  TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Username',
//                         prefixIcon: const Icon(Icons.person),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         prefixIcon: const Icon(Icons.lock),
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                       ),
//                       obscureText: true,
//                     )