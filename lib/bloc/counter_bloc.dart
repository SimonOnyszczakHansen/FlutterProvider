// CounterBloc handles the logic of incrementing and decrementing a counter.
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Initializes the CounterBloc with a counter value of 0.
  CounterBloc() : super(const CounterState(0)) {
    // Handler for incrementing the counter.
    on<IncrementCounterEvent>(
      (event, emit) => emit(CounterState(state.counter + 1)),
    );

    // Handler for decrementing the counter, only if it's greater than 0.
    on<DecrementCounterEvent>(
      (event, emit) {
        if (state.counter > 0) {
          emit(CounterState(state.counter - 1));
        }
      },
    );
  }
}
