import 'package:flutter/material.dart';

import 'package:flutterstatemanagement/get_x/get_x.dart';
import 'package:flutterstatemanagement/riverpod/riverpod.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("State Management Example "),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetXState()));
                },
                child: Text(
                  "Get X",
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RiverPod()));
                },
                child: Text(
                  "RiverPod",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

