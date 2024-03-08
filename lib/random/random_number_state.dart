import 'package:flutter_application_1/bloc/counter_event.dart';

abstract class RandomNumberState extends CounterEvent {}

class GenerateRandomNumberState extends RandomNumberState {}

class RandomNumberStateIncrement extends RandomNumberState {}

class RandomNumberStateDecrement extends RandomNumberState {}