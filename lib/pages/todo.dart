import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todo extends StatelessWidget {
  final String task;
  final bool completed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;



  const Todo({
    super.key,
    required this.task,
    required this.completed,
    required this.onChanged,
    required this.deleteFunction,
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25,right:25,left:25),      
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: 'Delete',  // Optional: to show a label for the action
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF090507),
        
          ),
          child: Row(
            children: [

              Checkbox(
                value: completed, 
                onChanged: onChanged,
                checkColor: Color.fromARGB(255, 195, 204, 205),
                activeColor: Colors.white30,
              ),
              Text(
              task,
              style: TextStyle(
                fontSize: 18,
                decoration: completed 
                  ?  TextDecoration.lineThrough
                  : TextDecoration.none,
                  color: Colors.white,
                  decorationThickness: 2.5,
              ) ,
              ),
            ],
          ),
          
        
        ),
      ),
    );
  }
}