import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testas/cons.dart';
import 'package:testas/logic/cubit.dart';
import 'package:testas/logic/states.dart';

class RadioClass extends StatelessWidget {
  const RadioClass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: prmiary_color,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(AppCubit.get(context).type.toString(),style: TextStyle(  
                        color: sec_color
                      ),),
                    ),),
                  SizedBox(width: 30,),
                  Text("all"),
                  
                  Radio(
                     fillColor:
                        MaterialStateColor.resolveWith((states) => prmiary_color),
                      value: 0,
                      groupValue: AppCubit.get(context).current_value,
                      onChanged: ((value) {
                       AppCubit.get(context).chnageRadioButtom(value!);
                      })),
                  Text("Important"),
                  Radio(
                     fillColor:
                        MaterialStateColor.resolveWith((states) => prmiary_color),
                      value: 1,
                      groupValue:  AppCubit.get(context).current_value,
                      onChanged: ((value) {
                       AppCubit.get(context).chnageRadioButtom(value!);
                      })),
                  Text("Daily"),
                  Radio(
                     fillColor:
                        MaterialStateColor.resolveWith((states) => prmiary_color),
                      value: 2,
                      groupValue:  AppCubit.get(context).current_value,
                      onChanged: ((value) {
                        AppCubit.get(context).chnageRadioButtom(value!);
                      })),
                  Text("Shopping "),
                  Radio(
                     fillColor:
                        MaterialStateColor.resolveWith((states) => prmiary_color),
                      value: 3,
                      groupValue:  AppCubit.get(context).current_value,
                      onChanged: ((value) {
                      AppCubit.get(context).chnageRadioButtom(value!);
                      })),
                  Text("Work"),
                  Radio(
                     fillColor:
                        MaterialStateColor.resolveWith((states) => prmiary_color),
                    value: 4,
                    groupValue: AppCubit.get(context).current_value,
                    
                    onChanged: ((value) {
                       AppCubit.get(context).chnageRadioButtom(value!);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
      },

     
    );
  }
}
