import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testas/logic/model.dart';
import 'package:testas/logic/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List <int> id_list=[];
  void changeidlist(){
    var i =Random().nextInt(20);
    id_list.add(i);
    print("id is ${id_list.length}");
    print(id_list);
    emit(ChangeIdList());
  }
   int current_value=0;
    String type="all";

   void chnageRadioButtom( int val){
   current_value=val;
   switch (current_value) {
     case 0:type="all";
       break;
       case 1:type="important";
       break;
       case 2:type="Daily";
       break;
       case 3:type="Shopping";
       break;
       case 4:type="work";
       break;
       
     default:
   }
   emit(ChangeState());
  }
  int current_index = 0;

   List list = ["All", "Important", "Daily", "Shopping", "Work"];
  void changeTybeList(index) {
    current_index = index;
    getdatabase();
    emit(ChangeTypeListState());
  }
  List<List<Map>> entire_list=[
    
  ];
  
   List<Map> all_list = [];
   List<Map> important_list = [];
   List<Map> daily_list = [];
   List<Map> shopping_list = [];
   List<Map> working_list = [];
   List<Map> done_list=[];
   

  void createdatabase() async {
    var databasepath = await getDatabasesPath();
    var path = join(databasepath, "todo.db");

    Database database=await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database database, version) async {
        print("database has been created");
        await database
            .execute(
                'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT, type TEXT)')
            .then((value) {
          print("table has been created  ");
        });
      },
   
    );
  }

  void insertDataBase(Task task) async {
     var databasepath = await getDatabasesPath();
    var path = join(databasepath, "todo.db");
    Database database= await openDatabase(path);
   
    database.insert("todo",task.toMap()).then((value) {
      print("inserted list is " + value.toString());
      emit(InsertDataBase());
      getdatabase();
    });
  }

   void getdatabase() async {
    all_list = [];
    important_list=[];
    daily_list=[];
    shopping_list=[];
    working_list=[];
    done_list=[];
    var databasepath = await getDatabasesPath();
    var path = join(databasepath, "todo.db");
    Database database= await openDatabase(path);
    await database.rawQuery('SELECT * FROM todo').then((value){
      value.forEach((element) {
        if (element['type'] == 'all' && element["status"]=="new")
          all_list.add(element);
        else if (element['type'] == "important"&& element["status"]=="new")
          important_list.add(element);
        else if (element['type'] == "Daily"&&element["status"]=="new")
          daily_list.add(element);
          else if (element['type'] == "Shopping"&&element["status"]=="new")
          shopping_list.add(element);
          else if (element['type'] == "work"&&element["status"]=="new"){
            working_list.add(element);

          }
          entire_list=[
            all_list,
            important_list,
             daily_list,
            shopping_list,
            working_list
           


          ];

      });
      value.forEach(((element) {
        if(element["status"]=="done")
        {
          done_list.add(element);

        }
        
      }));
      print("entire list ${entire_list[0]}");

      
      emit(GetDataBase());
      print("done list $done_list");
      print("all list $all_list");
      print("important $important_list");
      print("daily $daily_list");
      print("shopping $shopping_list");
      print("working $working_list");
    }).catchError((onError){

    });

  }
  void updatedata({required String status, required int id})async {
    var databasepath = await getDatabasesPath();
    var path = join(databasepath, "todo.db");
    Database database= await openDatabase(path);
    database.rawUpdate('UPDATE todo SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getdatabase();
      print(value);
      emit(UpdateDataState());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
