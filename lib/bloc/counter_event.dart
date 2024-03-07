// Events that can be processed by CounterBloc.
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Event to increment the counter.
class IncrementCounterEvent extends CounterEvent {}

// Event to decrement the counter.
class DecrementCounterEvent extends CounterEvent {}
