import 'package:dio/dio.dart';
import 'package:secondwork/secondwork.dart' as secondwork;

import 'models/getCar.dart';

void main(List<String> arguments) async {
  Dio httpClient = Dio();
  String url = 'http://myfakeapi.com/api/cars/';
  var response = await httpClient.get(url);
  List<dynamic> data = response.data['cars'];
  List<GetCar> carList =[];
  for (Map<String,dynamic> cars in data) {
    carList.add (GetCar.fromJson(cars));
  }   
  int count = 0; 
  double sum =0.0;
  for (var car in carList) {
    if (car.car_color == "Yellow") {
      count ++;
      double price = double.parse(car.price.substring(1));
      sum += price;
    }
  }
  double average = sum/count;
  print('$average');
} 
