import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../repositories/salahTimeRepo.dart';
import 'dataEvent.dart';
import 'dataState.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  SalahTimeRepo salahTimeRepo = Get.put(SalahTimeRepo());
  var api = [].obs;
  DataBloc(this.salahTimeRepo) : super(DataInitialState()) {
    on<DataEvent>((event, emit) async {
      if (event is LoadDataEvent) {
        emit(DataLoadingState());
        var apiValue = (await SalahTimeRepo.getSalahTime('Dhaka'));
        if (apiValue == null) {
          emit(DataErrorState());
        } else {
          emit(DataLoadedState(api: api));
        }
      }
    });
  }
}
