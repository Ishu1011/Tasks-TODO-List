import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/buttons.dart';

class DialogAlert extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogAlert({super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "add new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                //save buttton
                Buttons(text: "save", onPressed: onSave),
                const SizedBox(width:10),
                //camcel button
                Buttons(text: "cancel", onPressed: onCancel),

              ],
            )

        ],)
      ),
    );
  }
}