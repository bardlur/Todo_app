import '../data/type_enum.dart';
import '../data/type_task.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: 'images/work_meeting.png', 
      title: 'جلسه', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/study.png', 
      title: 'مطالعه', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/banking.png', 
      title: 'کار بانکی', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/meditate.png', 
      title: 'مدیتیشن', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/hard_working.png', 
      title: 'کار', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/workout.png', 
      title: 'ورزش', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: 'images/social_friends.png', 
      title: 'دوستان', 
      taskTypeEnum: TaskTypeEnum.focus,
    ),
  ];
   
  return list;
}