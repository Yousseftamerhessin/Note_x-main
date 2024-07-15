import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testas/layouts/form_widget.dart';
import 'package:testas/logic/cubit.dart';
import 'package:testas/layouts/horiznotal_listview.dart';
import 'package:testas/layouts/Radio.dart';
import 'package:testas/logic/model.dart';
import 'package:testas/logic/notification.dart';
import 'package:testas/logic/states.dart';
import 'package:testas/layouts/info_screen.dart';

import '../cons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  String type = "";
  void changetype(value) {
    setState(() {
      type = value;
    });
  }

  bool isshown = false;
  TextEditingController title_controller = TextEditingController();
  TextEditingController time_controller = TextEditingController();
  TextEditingController date_controller = TextEditingController();
  TextEditingController time =TextEditingController();
  Duration duration= Duration();
  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     NotificationApi.init();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AppCubit()..createdatabase()..getdatabase(),

      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
              backgroundColor: prmiary_color,
              elevation: 0.0,
             
            ),
            backgroundColor: prmiary_color,
          body: Column(
            children: [
               Container(
                    height: 100,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Note",
                          style: TextStyle(
                              color:sec_color,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 30),
                          child: Text(
                            "X",
                            style: TextStyle(
                                color: sec_color,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  
                  HorizontalListView(state: state,),
                  
              SizedBox(
                    height: 40,
                  ),
            (state is GetDataBase)?  Expanded(child: InfoScreen(list: AppCubit.get(context).entire_list[AppCubit.get(context).current_index],)):Center(child: Text(""),),
              
            ],
          ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: 
              
            
              Container(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.add,color: prmiary_color,),
                  backgroundColor: sec_color,
                  onPressed: () {
                    if (isshown) {
                      if (formkey.currentState!.validate()) {
                       
                        NotificationApi.schdNotfication(
                         id:AppCubit.get(context).id_list.length,
                title: title_controller.text,
                msg: title_controller.text,
                payload: "Note X",
                
                time: DateTime.parse("${date_controller.text} ${time.text}")).catchError((onError){
                  
                });
                AppCubit.get(context).changeidlist();
                        Task task=Task(title: title_controller.text,time: time_controller.text,date:date_controller.text,
                        type:AppCubit.get(context).type,status: "new"  );
                        AppCubit.get(context).insertDataBase(task);
                        Navigator.pop(context);
                        setState(() {
                          isshown = false;
                        });
                      }
                    } else {
                      scaffoldkey.currentState!.showBottomSheet((context) {
                        return FormWidget(formkey: formkey, title_controller: title_controller, date_controller: date_controller, time_controller: time_controller,time: time,);
                      });
                      setState(() {
                        isshown=true;
                      });
                    }
                  },
                ),
              ),
            
          
        );
          
        },
      
      ),
    );
  }
}

