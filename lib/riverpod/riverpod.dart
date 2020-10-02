
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterstatemanagement/riverpod/controller/provider.dart';
import 'package:hooks_riverpod/all.dart';
class RiverPod extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final text=useProvider(textProvider);
    final futureInt=useProvider(futureProvider);
    final streamValue=useProvider(streamProvider);
    final state=useProvider(stateProvider);

    final int stateNotifierState=useProvider(stateNotifierProvider.state);
    final changeNotifier=useProvider(changeNotifierProvider);
return Scaffold(
  appBar: AppBar(
    title: Text("Riverpod"),
  ),
  body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Text from provider:"+ text),
        SizedBox(height: 20,),
        futureInt.when(data: (config){return Text("future provider: "+ config.toString());}, loading: ()=>CircularProgressIndicator(), error: (err,stack)=>Text("Error:"+ err)),
        SizedBox(height: 20,),
        streamValue.when(data: (config){return Text("stream provider: "+ config.toString());}, loading: ()=>CircularProgressIndicator(), error: (err,stack)=>Text("Error:"+ err)),
        SizedBox(height: 20,),
        Text("state provider: "+ state.state.toString()),
        SizedBox(height: 20,),
        Text("state notifier provider: "+ stateNotifierState.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(onPressed:()=>context.read(stateNotifierProvider).add() ,child: Text("ADD"),),
            RaisedButton(onPressed:()=>context.read(stateNotifierProvider).sub() ,child: Text("SUB"),),
          ],
        ),
        Text("Change notifier provider: "+ changeNotifier.number.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(onPressed:()=>changeNotifier.add() ,child: Text("ADD"),),
            RaisedButton(onPressed:()=>changeNotifier.sub() ,child: Text("SUB"),),
          ],
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: (){
      state.state++;
    },
    child: Icon(Icons.add),
  ),
);
  }


}