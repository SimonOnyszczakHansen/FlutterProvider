import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0; // Private variable to store the counter value

  int get counter => _counter;// Getter to access the private counter variable

  void incrementCounter() {
    _counter++;// Increments the counter
    notifyListeners();// Notifies all the listeners about the changes
  }

  void decrementCounter() {
    if (_counter != 0) {
      _counter--;
      notifyListeners();
    }
  }
}