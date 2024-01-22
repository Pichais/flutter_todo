import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';

class TabDone extends StatefulWidget {
  const TabDone({super.key});

  @override
  State<TabDone> createState() => _TabDoneState();
}

class _TabDoneState extends State<TabDone> {
      @override
  void initState() {
    context.read<HomeBloc>().add(LoadDoneBloc());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DONE'),),
    );
  }
}