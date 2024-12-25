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

  insertNewStudent({required String name, required int age, required double salary} )async{
    await supabase.from("students").insert({
      "name":name,
      "age":age,
      "salary":salary,
    });
  }

  deleteUser({required int id})async{
    await supabase.from("students").delete().eq("id",id );
  }
 updateUser({required String name, required int id, required double salary}) async {
    await supabase.from("student").update({"name":name,"salary":salary}).eq("id", id);
  }

// auth table 
  singup({required String email, required String password})async{
    await supabase.auth.signUp(password: password, email: email);
  }

  login({required String email, required String password})async{
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  
}
