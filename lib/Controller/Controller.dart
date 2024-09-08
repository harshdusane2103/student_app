import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student_app/DataBase/Database.dart';
import 'package:student_app/Modal/Modal.dart';


class StudentController extends GetxController

{
    RxList<StudentModal> StudentList=<StudentModal>[].obs;
    TextEditingController txtId=TextEditingController();
    TextEditingController txtage=TextEditingController();
    TextEditingController txtname=TextEditingController();
     // DatabaseHelper? databaseHelper;
    @override
    void onInit()
    {
        super.onInit();
        fetchData();
    }
    Future<void> fetchData()
    async {
      await DbHelper.dbHelper.database;
      readDataCome();
    }

    Future<void> readDataCome()
    async {
           List data = await DbHelper.dbHelper.readData();
           StudentList.value = data.map((e)=>StudentModal.fromMap(e),).toList();
    }

    void insertRecords(StudentModal student)
    async {
       await DbHelper.dbHelper.insertData(student);
       readDataCome();
    }
    void updataRecords(StudentModal student,int index)
    {
      DbHelper.dbHelper.updateData(student, index);
      fetchData();
      readDataCome();
    }
    void deleteData(int index)
    {
           DbHelper.dbHelper.deleteData(index);
           fetchData();
    }


}
