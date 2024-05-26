import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/pages/todo.dart';
import 'package:flutter_application_1/util/dialog_alert.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //refernce the hive box
  final _mybox = Hive.box("mybox");
  final _controller = TextEditingController();

  Database db = Database();

  void initState(){
    if(_mybox.get('NAVI')==null){
      db.createIntialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  void checkedbox(bool? value,int index){
    setState(() {
      db.navi[index][1] = !db.navi[index][1];
    });
    db.updateData();

  }
  void saveText(){
    setState(() {
      db.navi.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateData();

  }
  void createTask(){
    showDialog(context: context, builder: (context){
      return DialogAlert(
        controller: _controller,
        onSave: saveText,
        onCancel:() => Navigator.of(context).pop(),
      ) ; 
    },
    );    
  }
  void deleteTask(int index){
    setState(() {
      db.navi.removeAt(index);
    });
    db.updateData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 107, 107),

      appBar: AppBar(
        title: Text("TO DO"),
        leading: Icon(Icons.task),
        elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: Icon(Icons.add),

        ),
      body: ListView.builder(
        itemCount: db.navi.length,
        itemBuilder:(BuildContext context,int index){
          return Todo(
            task: db.navi[index][0], 
            completed: db.navi[index][1],
            onChanged:(value) => checkedbox(value,index),
            deleteFunction: (context) => deleteTask(index),
            );
        }
      )
    );
  }
}