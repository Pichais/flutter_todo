import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_todo/widgets/carditem.dart';

class TabTodo extends StatefulWidget {
  const TabTodo({super.key});

  @override
  State<TabTodo> createState() => _TabTodoState();
}

class _TabTodoState extends State<TabTodo> {
  ScrollController scrollcontroller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadTodoBloc());
    scrollcontroller.addListener(() {
      if (scrollcontroller.offset >= scrollcontroller.position.maxScrollExtent) {
        print('Load more data ');
         context.read<HomeBloc>().add(LoadMoreDataBloc());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, Homestate>(
        builder: (context, state) {
          if (state is InitailState) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is ErrorState) {
            return const Center(child: Text('ERROR STATE'),);
          } else {
            var data = (state as FinishState);
            print('data.tasks!.length = ${data.tasks.length}');
            print('homebloc is load is ${context.read<HomeBloc>().isLoading}');
            return ListView.builder(
              controller: scrollcontroller,
              padding: const EdgeInsets.only(top: 10),
              itemCount:  context.read<HomeBloc>().isLoading ? data.tasks.length +1 : data.tasks.length,
              itemBuilder: (context, index) {
                if(index == data.tasks.length){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return CardItem(index: index, tasks: data.tasks,);
              }
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }
}
