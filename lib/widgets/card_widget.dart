import 'dart:ffi';

import 'package:flutteer_day10/constant/spacing.dart';
import 'package:flutteer_day10/model/student.dart';
import 'package:flutteer_day10/pages/list_pages.dart';
import 'package:flutteer_day10/service/database.dart';
import 'package:flutteer_day10/widgets/textfeild_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Student student;

  const CardWidget({super.key, required this.student});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController salaryCont = TextEditingController();
  void clearData() {
    nameCont.clear();
    salaryCont.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text("${widget.student.id})"),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(widget.student.name!),
                  ],
                ),
              ),
              Text(widget.student.age.toString()),
              Text(widget.student.salary.toString()),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await Database().deleteUser(id: widget.student.id!);
                      if (context.mounted) {
                        context
                            .findAncestorStateOfType<ListPagesState>()
                            ?.setState(() {});
                      }
                    },
                    child:
                        const Icon(Icons.delete, size: 20, color: Colors.red),
                  ),
                  height12,
                  InkWell(
                      onTap: () {
                        nameCont.text = widget.student.name!;
                        salaryCont.text = widget.student.salary.toString();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    height24,
                                    TextFieldWidget(
                                        controller: nameCont, text: "name"),
                                    height24,
                                    TextFieldWidget(
                                        controller: salaryCont, text: "salary"),
                                    height24,
                                    ElevatedButton(
                                      onPressed: () async {
                                        try {
                                          await Database().updateUser(
                                              name: nameCont.text,
                                              salary:
                                                  double.parse(salaryCont.text),
                                              id: widget.student.id!);
                                          if (context.mounted) {
                                            clearData();
                                            context
                                                .findAncestorStateOfType<
                                                    ListPagesState>()
                                                ?.setState(() {});
                                            Navigator.pop(context);
                                          }
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(e.toString()),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade100,
                                      ),
                                      child: const Text(
                                        "edit student",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.edit, size: 20)),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
