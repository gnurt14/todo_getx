import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_getx/database/database_helper.dart';
import 'package:todo_getx/model/task_data.dart';

class TaskController extends GetxController{
  var taskData = List<TaskData>.empty().obs;
  late TextEditingController addTaskController;
  @override
  void onInit() {
    addTaskController = TextEditingController();
    _getData();
    super.onInit();
  }

  void _getData(){
    DatabaseHelper.instance.queryAllRows().then((value){
      value.forEach((element){
        taskData.add(TaskData(id: element['id'], title: element['title']));
      });
    });
  }

  void addData() async{
    await DatabaseHelper.instance.insert(TaskData(title: addTaskController.text));
    taskData.insert(0, TaskData(id: taskData.length, title: addTaskController.text));
    addTaskController.clear();
  }

  void deleteTask(int id) async{
    taskData.removeWhere((element) => element.id == id);
  }
}