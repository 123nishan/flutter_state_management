import 'package:get/get.dart';

class CountController extends GetxController{
  int count=0;


  void increment(){
    count++;
    //this will update get builder
    update();
  }
}