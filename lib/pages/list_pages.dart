import 'package:flutteer_day10/service/database.dart';
import 'package:flutteer_day10/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ListPages extends StatelessWidget {
  const ListPages({super.key});

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
      )
    );
    }
  }
