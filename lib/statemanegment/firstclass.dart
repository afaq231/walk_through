import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walk_through/statemanegment/firstclass2.dart';

import 'countermodel.dart' show CounterModel;


class FirstClass extends StatefulWidget {
  const FirstClass ({super.key});

  @override
  State<FirstClass> createState() => _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.blue ,
      appBar: AppBar(title: Text('counter app'),),
    body: Center(
      child: Consumer<CounterModel>(builder:(context,counter,child) {
        return
          Text('count:$counter',
            style: TextStyle(fontSize: 32),
          );
      }
      ),
    ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1", // multiple FAB me unique tag dena zaroori hai
            onPressed: () {
              context.read<CounterModel>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10), // thoda gap
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              context.read<CounterModel>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
          ElevatedButton(onPressed:(){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => Firstclass2()),
            );}, child: Text('go to secondclass'))
        ],
      ),

    );



      }}

