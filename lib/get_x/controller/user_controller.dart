
import 'package:flutterstatemanagement/model/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  // here obs wraps user class with property like update and other
  final user=User().obs;

  updateUser(int count){
    user.update((val) {
      val.name="Nishan";
      val.count=count;
      //we dont need update here because it is listening , it will update automatically
    });
  }
}