import 'package:get/get.dart';
import 'package:livetracking/model/salahtimemodel.dart';
import '../repositories/salahTimeRepo.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  SalahTimeModel? salahTimeModel;
  var cityName = 'Dhaka'.obs;
  Controller({required cityName});
  @override
  void onInit() {
    fetch(cityName);
    super.onInit();
  }

  Future fetch(var cityName) async {
    try {
      isLoading(true);
      var salahTime = (await SalahTimeRepo.getSalahTime(cityName));
      if (salahTime != null) {
        print(salahTime);
        Rx(salahTimeModel = salahTime);
      }
    } finally {
      isLoading(false);
    }
  }
}