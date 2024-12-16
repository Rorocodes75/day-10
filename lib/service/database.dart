import 'package:flutteer_day10/model/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;
  Future <List<Student>> gatData() async {
    var response = await supabase.from("students").select();
    List<Student> studentList =[];
    for (var element in response){
      studentList.add(Student.fromJson(element));
    }
    return studentList;
  }
}
