import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testas/logic/bloc_observer.dart';
import 'package:testas/layouts/home.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    tz.initializeTimeZones();

    Bloc.observer = AppBlocObserver();

  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    home: Home(),
    title: "Note X",
    debugShowCheckedModeBanner: false,
    
  ));
}




