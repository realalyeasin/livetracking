import 'package:get/get.dart';
import 'package:livetracking/model/salahtimemodel.dart';
import 'package:http/http.dart' as http;
class SalahTimeRepo {
  var cityName = 'Dhaka'.obs;
  static Future<SalahTimeModel?> getSalahTime(var cityName) async {
    String url = 'https://muslimsalat.com/$cityName/daily.json?key=fa69d444f79bb749174c9cbaa473e9ed';
    final response = await http.Client().get(Uri.parse(url));
    if(response.statusCode != 200){
      throw Exception();
    } else {
      print(response.body);
      return salahTimeModelFromJson(response.body);
    }
  }
}