import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:snack_track_app/profile/profile.dart';

import '../../helpers/helpers.dart';

class MockCounterBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const ProfilePage());
      expect(find.byType(ProfileView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late ProfileBloc counterCubit;

    setUp(() {
      counterCubit = MockCounterBloc();
    });

    testWidgets('renders current count', (tester) async {
      final state = ProfileLoading();
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit, child: const ProfileView()),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped', (
      tester,
    ) async {
      // when(() => counterCubit.state).thenReturn(0);
      // when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit, child: const ProfileView()),
      );
      await tester.tap(find.byIcon(Icons.add));
      // verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped', (
      tester,
    ) async {
      // when(() => counterCubit.state).thenReturn(0);
      // when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(value: counterCubit, child: const ProfileView()),
      );
      await tester.tap(find.byIcon(Icons.remove));
      // verify(() => counterCubit.decrement()).called(1);
    });
  });
}
