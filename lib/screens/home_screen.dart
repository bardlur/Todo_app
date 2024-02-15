import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:to_do/screens/add_task_screen.dart';
import 'package:to_do/data/task.dart';
import 'package:to_do/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';

  var controller = TextEditingController();
  var box = Hive.box('names');
  var taskBox = Hive.box<Task>('taskBox');

  bool isFabVisible = true;

  @override
  Widget build(BuildContext caontext) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable:  taskBox.listenable(),
          builder: (context, value, child) {
            return  NotificationListener <UserScrollNotification> (
              onNotification: (notification) {
                setState(() {
                  if(notification.direction == ScrollDirection.forward) {
                    isFabVisible = true;
                  }

                  if(notification.direction == ScrollDirection.reverse) {
                    isFabVisible = false;
                  }
                });

                return true;
              },
              child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (BuildContext context, int index) {
                  var task = taskBox.values.toList()[index];
                  return getListItem(task);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext) => AddTaskScreen()
              ),
            );
          },
          backgroundColor: Color(0xFF0BD79D),
          child: Image.asset('images/icon_add.png'),
        ),
      ),
    );
  }

  Widget getListItem(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        task.delete();
      },
      child: TaskWidget(task: task),
    );
  }
}