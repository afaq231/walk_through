import 'package:flutter/material.dart';

class Firstclass2 extends StatefulWidget {
  const Firstclass2({super.key});

  @override
  State<Firstclass2> createState() => _Firstclass2State();
}

class _Firstclass2State extends State<Firstclass2> {
  int counter = 0;  // counter define karna hoga

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text('Counter App Second Class')),
      body: Center(
        child: Text(
          'count: $counter',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
