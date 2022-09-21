import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:livetracking/bloc/dataBloc.dart';
import 'package:livetracking/bloc/dataState.dart';
import 'package:livetracking/model/salahtimemodel.dart';
import 'package:livetracking/screens/homeview.dart';
import 'bloc/dataEvent.dart';
import 'controller/controller.dart';
import 'repositories/salahTimeRepo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Get.put(Controller(cityName: 'Dhaka'));
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 148, 209, 166),
        appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            centerTitle: true,
            title: const Text(
              'Live Location Tracking',
              style: TextStyle(fontStyle: FontStyle.italic, letterSpacing: 1),
            )),
        body: BlocBuilder<DataBloc, DataState>(builder: (context, state) {
          if (state is DataInitialState) {
            context.read<DataBloc>().add(LoadDataEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadingState) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DataLoadedState)  {
            return HomeView();
          } else if (state is DataErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        }));
  }
}
