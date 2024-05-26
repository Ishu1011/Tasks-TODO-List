import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/todo.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:gif_view/gif_view.dart';


void main() async {
  //database hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  Home(),
      
      //theme: ThemeData(primarySwatch: Colors.blue),
      
    );
  }
}
