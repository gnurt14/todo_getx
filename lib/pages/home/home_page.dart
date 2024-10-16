import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controller/task_controller.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List'),),
      body: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: _taskController.addTaskController,
                  decoration: const InputDecoration(hintText: 'Enter a task'),
                ))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _taskController.addData();
      }),
    );
  }

}