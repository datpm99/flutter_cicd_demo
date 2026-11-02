import 'package:bloc/bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

final class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) => emit(state + 1));
  }
}
