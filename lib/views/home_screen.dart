import 'package:flutter/material.dart';
import 'package:flutter_todo/views/tabbar/tab_doing.dart';
import 'package:flutter_todo/views/tabbar/tab_done.dart';
import 'package:flutter_todo/views/tabbar/tab_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabs = [
    const Tab(text: 'TODO'),
    const Tab(text: 'DOING'),
    const Tab(text: 'DONE'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight - 8.0),
            child: Container(
              height: kToolbarHeight - 8.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 3, // Blur radius
                    offset: const Offset(0, 2), // Changes position of shadow
                  ),
                ],
              ),
              child: TabBar(
                labelStyle: TextStyle(color: Colors.white),
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: false,
                tabs: _tabs,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: Colors.green.shade300),
              ),
            ),
          ),
          title: const Text(
            'TODO APPLICATION',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: 0.2, // Adjust the opacity as needed
                child: Image.asset(
                  "images/panda3.jpg", // Replace with your image asset
                  fit: BoxFit.cover, // This will fill the background
                ),
              ),
              // You can add more widgets here if you want to add more content over the image
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TabTodo(),
            TabDoing(),
            TabDone(),
          ],
        ),
      ),
    );

  }
}
