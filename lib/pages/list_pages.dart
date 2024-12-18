import 'package:flutteer_day10/constant/spacing.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutteer_day10/widgets/card_widget.dart';
import 'package:flutteer_day10/widgets/textfeild_widget';
import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  const ListPages({super.key});

  @override
  State<ListPages> createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();TextEditingController salary = TextEditingController();
  void clearData(){
    name.clear();
    age.clear();
    salary.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(future: Database().gatData(), builder: (context, snapshot){
        if(snapshot.connectionState== ConnectionState.done){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
            var item = snapshot.data![index];
            return CardWidget(age: item.age, id: item.id, name: item.name, salary: item.salary,
            );

          },);
        }else if(snapshot.connectionState== ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else{
          return const Center(child: Text("error"),);
        }
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        showDialog(
        context: context,
        builder: (context){
          return Dialog(
            child: Padding(padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldWidget(text: "name", controller: name),height24,
                 TextFieldWidget(text: "age", controller: age),height24, TextFieldWidget(text: "salary", controller: salary),height24,
                 ElevatedButton(onPressed: ()async{
                  try{
                    await Database().insertNewStudent(name: name.text, age: int.parse(age.text), salary: double.parse(salary.text));
                    if(context.mounted){
                      clearData();
                      setState(() {
                        
                      });
                      Navigator.pop(context);
                    }
                  }catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                 },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                 ), child: const Text("insert", style: TextStyle(fontSize: 18),),
                 )
              ],
            ),),
          );
        }
        );
      },
      child: const Icon(Icons.add),
      ),
    );
    }
  }
