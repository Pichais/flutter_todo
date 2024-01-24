import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/bloc/home_bloc/home_bloc.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:flutter_todo/widgets/bg.dart';
import 'package:flutter_todo/widgets/carditem.dart';
import 'package:flutter_todo/widgets/date_format.dart';

class TabDone extends StatefulWidget {
  const TabDone({super.key});

  @override
  State<TabDone> createState() => _TabDoneState();
}

class _TabDoneState extends State<TabDone> {
  ScrollController scrollcontroller = ScrollController();
  @override
  void initState() {
    context.read<HomeBloc>().add(LoadDoneBloc());
         scrollcontroller.addListener(() {
      if (scrollcontroller.offset >=
          scrollcontroller.position.maxScrollExtent) {
        context.read<HomeBloc>().add(LoadMoreDataBloc(eventTosentAPI: 'DONE'));
      }
    });
    super.initState();
  }

      @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: boxDecoration,
        child: BlocBuilder<HomeBloc, Homestate>(
          builder: (context, state) {
            if (state is InitailState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return const Center(
                child: Text('ERROR STATE'),
              );
            } else {
              var data = (state as FinishState);
              var groupByDate =
                  groupBy(data.tasks, (obj) => obj.createdAt!.substring(0, 10));
              return ListView.builder(
                controller: scrollcontroller,
                padding: const EdgeInsets.only(top: 10),
                itemCount: groupByDate.keys.length,
                itemBuilder: (context, index) {
                  String date = groupByDate.keys.elementAt(index);
                  List<Tasks> tasksOfTheDay = groupByDate[date]!;
        
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 5),
                        child: Text(
                          formatDate(date),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tasksOfTheDay.length,
                        itemBuilder: (context, taskIndex) {
                          return CardItem(
                             onDismised: (value) => context.read<HomeBloc>().add(
                                ToDeleteDataBloc(
                                    id: tasksOfTheDay[taskIndex].id!)),
                            index: taskIndex,
                            tasks: tasksOfTheDay,
                            iconLottie: 'images/lottie/icondone.json',
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },),
      ),
    );
  }
}
