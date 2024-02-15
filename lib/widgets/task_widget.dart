import 'package:flutter/material.dart';
import 'package:to_do/data/task.dart';
import 'package:to_do/screens/edit_task_screen.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked =! isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: isBoxChecked, 
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4)
                        )
                      ),
                      onChanged: (isChecked) {
                        setState(() {
                  
                        });
                      },
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      widget.task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  widget.task.subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFFA6A4A4)
                  ),
                ),
              ), 
              Spacer(),
              getTimeAndEditBox()
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Row getTimeAndEditBox() {
    return Row(
      children: [
        Container(
          height: 28,
          width: 90,
          decoration: BoxDecoration(
            color: Color(0xFF18DAA3),
            borderRadius: BorderRadius.all(
              Radius.circular(15)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${getHourUnderTen(widget.task.time)}:${getMinUnderTen(widget.task.time)}',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(task: widget.task,)
              ),
            );
          },
          child: Container(
            height: 28,
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xFFe2f6f1),
              borderRadius: BorderRadius.all(
                Radius.circular(15)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ویرایش',
                  style: TextStyle(
                    color: Color(0xFF18DAA3)
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset('images/icon_edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getMinUnderTen(DateTime time) {
    if(time.minute < 10) {
      return '0${time.minute}';
    } else{
      return time.minute.toString();
    }
  }

  String getHourUnderTen(DateTime time) {
    if(time.hour < 10) {
      return '0${time.hour}';
    } else{
      return time.hour.toString();
    }
  }
}