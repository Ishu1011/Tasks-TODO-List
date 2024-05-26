import 'package:hive_flutter/hive_flutter.dart';

class Database{
  List navi = [];
  //initialize hive
  final _mybox = Hive.box('mybox');
  
  void createIntialData(){
    navi = [
      ['jog',false],
      ['cook',false],
    ];
  }
  
  void loadData(){
    navi = _mybox.get('NAVI');
  }

  void updateData(){
    _mybox.put('NAVI',navi);
  }
}