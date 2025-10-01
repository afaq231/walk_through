import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;   // private variable

  int get count => _count; // getter (read karne ke liye)

  void increment() {
    _count++;        // value badhao
    notifyListeners(); // sab widgets ko update kar do
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
