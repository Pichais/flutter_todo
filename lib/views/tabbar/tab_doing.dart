import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc/home_bloc.dart';

class TabDoing extends StatefulWidget {
  const TabDoing({super.key});

  @override
  State<TabDoing> createState() => _TabDoingState();
}

class _TabDoingState extends State<TabDoing> {
      @override
  void initState() {
    context.read<HomeBloc>().add(LoadDoingBloc());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DOING'),),
    );
  }
}