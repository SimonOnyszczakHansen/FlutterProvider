// States representing the count value in the CounterBloc.
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  final int randomNumber; // Ensure this exists to hold the random number

  const CounterState({this.counter = 0, this.randomNumber = 0});

  @override
  List<Object?> get props => [counter, randomNumber];

  CounterState copyWith({int? counter, int? randomNumber}) {
    return CounterState(
      counter: counter ?? this.counter,
      randomNumber: randomNumber ?? this.randomNumber,
    );
  }
}


