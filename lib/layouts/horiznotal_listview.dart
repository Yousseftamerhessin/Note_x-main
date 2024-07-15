import 'package:flutter/material.dart';
import 'package:testas/cons.dart';
import 'package:testas/logic/cubit.dart';
import 'package:testas/logic/states.dart';

class HorizontalListView extends StatelessWidget {
 AppStates state;
 HorizontalListView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
          itemCount: AppCubit.get(context).list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
               AppCubit.get(context).changeTybeList(index);
               print(AppCubit.get(context).current_index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: prmiary_color,
                      border:
                          Border.all(color: sec_color, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       AppCubit.get(context).list[index],
                        style: TextStyle(color: sec_color),
                      ),
                      Spacer(),
                      CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 10,
                          child: Center(
                              child: (state is GetDataBase)? Text(
                               
                            "${ AppCubit.get(context).entire_list[index].length}",
                            style: TextStyle(color: sec_color),
                          ):Text("")) )
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}