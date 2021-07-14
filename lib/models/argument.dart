import 'package:flutter/foundation.dart';
class Argument with ChangeNotifier
{ Argument({this.height,this.weight,this.age});
  double height = 170;
  double weight = 65;
  int age = 25;

  setHeight(double height){
    height = this.height;
    notifyListeners();
  }
  getHeight(){
    return height;
  }

  setWeight(double weight){
    weight = this.weight;
    notifyListeners();
  }
  getWeight(){
    return weight;
  }
  setAge(int age){
    age = this.age;
    notifyListeners();
  }
  getAge(){
    return age;
  }


}