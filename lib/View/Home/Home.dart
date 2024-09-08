import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/Controller/Controller.dart';
import 'package:student_app/Modal/Modal.dart';
import 'package:student_app/View/EntryDialog/entryDialog.dart';
import 'package:student_app/View/UpdateDialog/update_dailog.dart';
var controller=Get.put(StudentController());
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        // StudentModal student = StudentModal(2, 22, "Harsh ");
        showDialog(context: context,builder: (context)=>entryDialog(controller));
          // controller.insertRecords(student);

      },),
      body: Obx(()=>ListView.builder(itemCount:controller.StudentList.length,itemBuilder: (context, index) => ListTile(
        leading: Text(controller.StudentList[index].id.toString()),
        title: Text(controller.StudentList[index].name!),
        subtitle: Text(controller.StudentList[index].age.toString()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            GestureDetector(onTap: () {
              showDialog(context: context, builder:(context)=>updateDateDailog(controller,index, controller.StudentList[index].id!));
            },
                child: Icon(Icons.edit)),
            GestureDetector(onTap:(){
              controller.deleteData(controller.StudentList[index].id!);
            },child: Icon(Icons.delete)),
          ],
        ),
      ),)),
    );
  }
}
