import 'package:get/get.dart';

class SumController extends GetxController{
  final count1=0.obs;
  final count2=0.obs;
  increment()=> count1.value++;
  increment2()=>count2.value++;
  int get sum=>count1.value+count2.value;

  @override
  void onInit() {
    // TODO: implement onInit
    // also known as workers
    ever(count1, (val)=>print("count 1 has been changed"));
    once(count1, (val)=>print("count 1 has been changed frist time"));
    debounce(count1, (val)=>print("count 1 has not been changed for 1s"),time: Duration(seconds: 1));
    interval(count1, (val)=>print("every 1 sec count1 is changed"),time: Duration(seconds: 1));
  }
}