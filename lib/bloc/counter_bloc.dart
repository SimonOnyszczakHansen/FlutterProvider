// CounterBloc handles the logic of incrementing and decrementing a counter.
import 'dart:math';

import 'package:flutter_application_1/random/random_number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int randomNumber = 0;
  // Initializes the CounterBloc with a counter value of 0.
  CounterBloc() : super(const CounterState(counter: 0, randomNumber: 0)) {
    // Handler for incrementing the counter.
    on<IncrementCounterEvent>(
        (event, emit) => emit(CounterState(counter: state.counter + 1)));
    // Handler for decrementing the counter
    on<DecrementCounterEvent>(
        (event, emit) => emit(CounterState(counter: state.counter - 1)));

    on<GenerateRandomNumberState>((event, emit) {
      randomNumber = Random().nextInt(100);
      emit(CounterState(randomNumber: randomNumber));
    });

    on<RandomNumberStateIncrement>((event, emit) {
      final newRandomNumber = state.randomNumber + 1;
      emit(state.copyWith(
          randomNumber: newRandomNumber));
    });

    on<RandomNumberStateDecrement>((event, emit) {
      final newRandomNumber = max(0, state.randomNumber - 1);
      emit(state.copyWith(
          randomNumber: newRandomNumber));
    });
  }
}
