import 'package:flutteer_day10/constant/spacing.dart';
import 'package:flutteer_day10/extension/nav.dart';
import 'package:flutteer_day10/pages/list_pages.dart';
import 'package:flutteer_day10/pages/login_page.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginPageState();
}

class _LoginPageState extends State<Signup> {
  TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

@override
@override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 89, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "sing up",
              style: TextStyle(fontSize: 24),
            ),
            height24,
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "enter email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            height24,
            TextField(controller: password,
            decoration: const InputDecoration(
                labelText: "enter password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center, children:[
              Text("if you have an account"),
             TextButton(onPressed: (){
              context.pushAndRemove(const LoginPage());
             }, child: Text("login"),),

            ],),
            height24,
            ElevatedButton(onPressed: () async {
              try{
              await Database().singup(email: email.text, password: password.text);
              if(context.mounted){
                Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> const ListPages()));
              }} catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())),);
            }}, style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade400
            ),
             child: const Text("sing up",style: TextStyle(fontSize: 18)))
          ],
        ),
      ),
    );
  }
}
