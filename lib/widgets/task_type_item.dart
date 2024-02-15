import 'package:flutter/material.dart';
import 'package:to_do/data/type_task.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    required this.taskType,
    required this.index,
    required this.selectedTaskItem,
  });

  TaskType taskType;
  
  int index;
  int selectedTaskItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100 ,
      decoration: BoxDecoration(
        color: (selectedTaskItem == index) ? Color(0xFF0BD79D)
          : Colors.transparent,
        border: Border.all(
          color: (selectedTaskItem == index) ? Color(0xFF0BD79D)
          : Colors.transparent, 
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
              color: (selectedTaskItem == index) ? Colors.white
                  : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}