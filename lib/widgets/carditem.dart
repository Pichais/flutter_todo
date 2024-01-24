import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:lottie/lottie.dart';

class CardItem extends StatelessWidget {
  final int index;
  final List<Tasks> tasks;
  final String iconLottie;
  final Function(DismissDirection value) onDismised;
  const CardItem({
    super.key,
    required this.index,
    required this.tasks,
    required this.iconLottie,
    required this.onDismised,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: InkWell(
          onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title:  Text(tasks[index].title!),
          content:  Text(tasks[index].description!),
          actions: <Widget>[
          
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
          child: Stack(
            clipBehavior:
                Clip.none, // allows the child to overflow the parent container
            children: [
              Container(
                 decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 2), // Changes position of shadow
            ),
          ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 70.h, //tasks[index].description!.length > 30 ?  null:
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 8,
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(tasks[index].id!),
                        onDismissed: onDismised,
                        background: Container(color: Colors.red),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Container color
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight:
                                    Radius.circular(16)), // Rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tasks[index].title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  tasks[index].description!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Color of the border
                      width: 5, // Width of the border
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 30,
                    child: Lottie.asset(iconLottie),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
