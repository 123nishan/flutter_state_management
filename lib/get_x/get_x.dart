import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controller/count_controller.dart';
import 'controller/user_controller.dart';
import 'second.dart';

class GetXState extends StatelessWidget {

//there are two to initilize get controller , one before build one in get builder
 //final CountController countController=Get.put(CountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(init:CountController(),builder: (val){
              return Text("current count value ${val.count}");
            }),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(init: UserController(),builder: (val){
              return Text("Name : ${val.user.value.name}");
            },),

            Obx((){
              return Text("Stored Count: ${Get.find<UserController>().user.value.count}");
            }),

            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Update data"),
              onPressed: () {
                Get.find<UserController>().updateUser(Get.find<CountController>().count);
              },
            ),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
              child: Text("Next Screen"),
              onPressed: () {
                Get.to(Second());
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          //if you dont initilize get controller in build then use this
          Get.find<CountController>().increment();
        },
      ),
    );
  }
}
