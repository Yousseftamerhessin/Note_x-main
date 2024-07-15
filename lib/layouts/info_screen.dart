import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testas/logic/cubit.dart';
import 'package:testas/logic/states.dart';

import '../cons.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, this.list});
  final list;
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .6,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Dismissible(
                background: Container(
                  color: Colors.green,
                  child: Icon(Icons.done_outline_sharp),
                ),
                key: Key(list[index].toString()),
                onDismissed: (direction) {
                  direction = DismissDirection.horizontal;
                  AppCubit.get(context)
                      .updatedata(status: "done", id: list[index]['id']);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: colorArray.elementAt( Random().nextInt(16)),
                    borderRadius: BorderRadius.circular(30)
                    
                    
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              list[index]['title'].toString(),
                              style: TextStyle(
                                  color: sec_color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        list[index]['time'].toString(),
                        style: TextStyle(
                            color: sec_color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                       SizedBox(height: 10,),
                      Text(
                        list[index]['date'].toString(),
                        style: TextStyle(
                            color: sec_color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ));
          },
        
        );
      },
    );
  }
}
