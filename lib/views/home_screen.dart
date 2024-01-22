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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Todo'),
              Tab(icon: Icon(Icons.hourglass_empty), text: 'Doing'),
              Tab(icon: Icon(Icons.done), text: 'Done'),
            ],
          ),
          title: const Text('TODO APPLICATION APP'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            TabTodo(),
            TabDoing(),
            TabDone(),
          ],
        ),
      ),
    );

    // return const Scaffold(
    //   body: SafeArea(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //        Text('Home Screen',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    //        DefaultTabController(
    //         length: 3,
    //         child: TabBar(
    //         tabs: [
    //           Tab(icon: Icon(Icons.format_list_bulleted_rounded),child: Text('TODO')),
    //           Tab(icon: Icon(Icons.hourglass_empty),child: Text('DOING')),
    //           Tab(icon: Icon(Icons.done_rounded),child: Text('DONE')),
    //         ],
    //                     ),
    //        ),

    //   ElevatedButton(
    //     onPressed: () {
    //      Navigator.pushAndRemoveUntil(
    // context,
    // MaterialPageRoute(
    //     builder: (BuildContext context) => BlocProvider(
    //           create: (context) => LoginBloc(),
    //           child: const LoginScreen(),
    //         )),
    // (route) => false);
    //     },
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Colors.grey.shade100,
    //       minimumSize: const Size(double.infinity,
    //           50), // double.infinity is the width and 50 is the height
    //     ),
    //     child: const Text('Log Out'),
    //       //   ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
