import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/models/todo_model.dart';

class CardItem extends StatelessWidget {
 final int index;
 final List<Tasks> tasks;
 const CardItem({
    super.key,
    required this.index,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Stack(
          clipBehavior:
              Clip.none, // allows the child to overflow the parent container
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: tasks[index].description!.length > 30 ?  null: 70.h,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
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
                            Text(tasks[index].createdAt!,style: const TextStyle(fontWeight: FontWeight.bold),),
                            Text(tasks[index].description!),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -3,
              left: 0,
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
                  radius: 40,
                  // child: const Icon(
                  //   Icons.book,
                  //   size: 30,
                  //   color: Colors.blue,
                  // ),
                ),
              ),
            ),
          ],
        ));
  }
}
