import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:to_do/data/task.dart';
import 'package:to_do/utility/utility.dart';
import 'package:to_do/widgets/task_type_item.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubtitle = TextEditingController();

  final box = Hive.box<Task>('taskBox');

  DateTime? _time;

  int _selectedTaskItem = 0;

  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState((){});
    });
    negahban2.addListener(() {
      setState((){});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15 ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskTitle,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  focusNode: negahban1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15
                    ),
                    labelText: 'عنوان تسک',
                    labelStyle: TextStyle(
                      color: negahban1.hasFocus ? Color(0xFF0BD79D) : Color(0xffc5c5c5),
                      fontSize: 20,
                    ),
                    focusColor: Color(0xFF0DA278),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffc5c5c5),
                        width: 3.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF0BD79D),
                        width: 3.0
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: controllerTaskSubtitle,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  focusNode: negahban2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15
                    ),
                    labelText: 'توضیحات تسک',
                    labelStyle: TextStyle(
                      color: negahban2.hasFocus ? Color(0xFF0BD79D) : Color(0xffc5c5c5),
                      fontSize: 20
                    ),
                    focusColor: Color(0xFF0BD79D),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xffc5c5c5),
                        width: 3.0
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF0BD79D),
                        width: 3.0
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: CustomHourPicker(
                title: 'زمان تسک رو انتخاب کن',
                titleStyle: TextStyle(
                  color: Color(0xFF0BD79D),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                negativeButtonText: 'حذف کن',
                positiveButtonText: 'انتخاب کن',
                elevation: 2 ,
                negativeButtonStyle: TextStyle(
                  color: Color(0xFFF40707),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                positiveButtonStyle: TextStyle(
                  color: Color(0xFF0BD79D),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                onPositivePressed: (context, time) {
                  _time = time;
                },
                onNegativePressed: (context) {
                  
                },
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getTaskTypeList().length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTaskItem = index;
                      });
                    },
                    child: TaskTypeItemList(
                      taskType: getTaskTypeList()[index],
                      index: index,
                      selectedTaskItem: _selectedTaskItem,
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0BD79D),
                minimumSize: Size(170, 50)
              ),
              onPressed: () {
                String taskTitle = controllerTaskTitle.text;
                String taskSubtitle = controllerTaskSubtitle.text;
                addTask(taskTitle, taskSubtitle);
                Navigator.of(context).pop();
              }, 
              child: Text(
                'اضافه کردن تسک',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
  
  addTask(String title, String subtitle) {
    var task = Task(
        title: title, 
        subtitle: subtitle, 
        time: _time!, 
        taskType: getTaskTypeList()[_selectedTaskItem],
      );
    box.add(task);
  }
}
