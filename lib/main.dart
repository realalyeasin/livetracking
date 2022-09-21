import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:livetracking/bloc/dataBloc.dart';
import 'package:livetracking/repositories/salahTimeRepo.dart';

import 'home.dart';

void main() {
  runApp(BlocProvider<DataBloc>(
    create: (context) => DataBloc(SalahTimeRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}
