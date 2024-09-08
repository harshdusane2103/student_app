
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/Controller/Controller.dart';
import 'package:student_app/Modal/Modal.dart';


  Widget entryDialog(StudentController Controller)
{
  return AlertDialog( title: Text('Enter Data'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(decoration: InputDecoration(labelText:('ID') ),controller: Controller.txtId,),
        TextField(decoration: InputDecoration(labelText:('Age') ),controller: Controller.txtage,),
        TextField(decoration: InputDecoration(labelText:('Name') ),controller: Controller.txtname,),
        TextButton(onPressed: () {
          Get.back();
        }, child: Text('Cancel')),
        TextButton(onPressed: () {
          int id=int.parse(Controller.txtId.text);
          int age=int.parse(Controller.txtage.text);
          String name=Controller.txtname.text;

          StudentModal student=StudentModal(id, age, name);
          Controller.insertRecords(student);

          Get.back();
          Controller.txtId.clear();
          Controller.txtname.clear();
          Controller.txtage.clear();


        }, child: Text('save'))
      ],
    ),
  );
}