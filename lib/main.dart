import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}



class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior:
              Clip.none, // allows the child to overflow the parent container
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Container color
                borderRadius: BorderRadius.circular(16), // Rounded corners
              ),
              child: const Center(
                  child: Text('Container')), // Other content of the container
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2.7,
              top:
                  -25, // Position it half outside the container (depends on the icon size)
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Color of the border
                    width: 2, // Width of the border
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 30,
                  child: const Icon(
                    Icons.book,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
