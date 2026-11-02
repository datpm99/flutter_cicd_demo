import 'package:demo_cicd/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc bloc;

    setUp(() {
      bloc = CounterBloc();
    });

    tearDown(() async {
      await bloc.close();
    });

    test('starts at zero', () {
      expect(bloc.state, 0);
    });

    test('increments for an increment event', () async {
      final states = expectLater(bloc.stream, emitsInOrder([1]));

      bloc.add(const CounterIncremented());

      await states;
      expect(bloc.state, 1);
    });

    test('processes consecutive increment events in order', () async {
      final states = expectLater(bloc.stream, emitsInOrder([1, 2, 3]));

      bloc
        ..add(const CounterIncremented())
        ..add(const CounterIncremented())
        ..add(const CounterIncremented());

      await states;
      expect(bloc.state, 3);
    });
  });
}
