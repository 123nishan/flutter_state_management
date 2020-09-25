import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controller/sum_controller.dart';
class Second extends StatelessWidget {
  final SumController sumController=Get.put(SumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(

              builder: (val){
                return Text('Count 1:       ${sumController.count1.value}', style: TextStyle(fontWeight: FontWeight.bold));
              },
            ),
            Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                return Text(
                  'Count 2:       ${sumController.count2.value}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                       ="),
            GetX<SumController>(builder: (_) {
              return Text(
                'Sum:               ${sumController.sum}',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                sumController.increment();
              },
            ),
            RaisedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                sumController.increment2();
              },
            ),
          ],
        ),
      ),
    );
  }
}
