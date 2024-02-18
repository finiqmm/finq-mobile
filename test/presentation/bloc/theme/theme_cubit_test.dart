import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:finq/domain/entities/app_error.dart';
import 'package:finq/presentation/bloc/theme/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetPreferredTheme mockGetPreferredTheme;
  late MockUpdateTheme mockUpdateTheme;
  late ThemeCubit sut;
  setUp(() {
    mockGetPreferredTheme = MockGetPreferredTheme();
    mockUpdateTheme = MockUpdateTheme();
    sut = ThemeCubit(
        getPreferredTheme: mockGetPreferredTheme, updateTheme: mockUpdateTheme);
  });

  tearDown(() => sut.close());
  test('initialState is light', () {
    expect(sut.state, ThemeBrightness.light);
  });

  group('loadPreferredTheme', () {
    blocTest<ThemeCubit, ThemeBrightness>(
        'should emit ThemeBrightness.dark when preferred theme is dark',
        build: () => sut,
        act: (ThemeCubit sut) {
          when(mockGetPreferredTheme(any))
              .thenAnswer((_) async => Right('dark'));
          sut.loadPreferredTheme();
        },
        expect: () => [ThemeBrightness.dark]);

    blocTest<ThemeCubit, ThemeBrightness>(
        'should emit ThemeBrightness.light when preferred theme is light',
        build: () => sut,
        act: (ThemeCubit sut) {
          when(mockGetPreferredTheme(any))
              .thenAnswer((_) async => Right('light'));
          sut.loadPreferredTheme();
        },
        expect: () => [ThemeBrightness.light]);

    blocTest<ThemeCubit, ThemeBrightness>(
        'should emit ThemeBrightness.light when getPreferredTheme fails',
        build: () => sut,
        act: (ThemeCubit sut) {
          when(mockGetPreferredTheme(any)).thenAnswer((_) async => Left(
              AppError(AppErrorType.database, "Error in retrieving theme")));
          sut.loadPreferredTheme();
        },
        expect: () => [ThemeBrightness.light]);
  });

  group('toggleTheme', () {
    blocTest<ThemeCubit, ThemeBrightness>(
      'should emit ThemeBrightness.dark when state is light',
      build: () => sut,
      seed: () {
        return ThemeBrightness.light;
      },
      act: (ThemeCubit sut) {
        when(mockUpdateTheme(any)).thenAnswer((_) async => Right(null));
        when(mockGetPreferredTheme(any)).thenAnswer((_) async => Right('dark'));
        sut.toggleTheme();
      },
      verify: (sut) {
        expect(verify(mockUpdateTheme(captureAny)).captured, ['dark']);
      },
      expect: () => const <ThemeBrightness>[ThemeBrightness.dark],
    );

    blocTest<ThemeCubit, ThemeBrightness>(
      'should emit ThemeBrightness.light when state is dark',
      build: () => sut,
      seed: () {
        return ThemeBrightness.dark;
      },
      act: (ThemeCubit sut) {
        when(mockUpdateTheme(any)).thenAnswer((_) async => Right(null));
        when(mockGetPreferredTheme(any))
            .thenAnswer((_) async => Right('light'));
        sut.toggleTheme();
      },
      verify: (sut) {
        expect(verify(mockUpdateTheme(captureAny)).captured, ['light']);
      },
      expect: () => const <ThemeBrightness>[ThemeBrightness.light],
    );

    blocTest<ThemeCubit, ThemeBrightness>(
      'should handle errors from updateTheme',
      build: () => sut,
      seed: () => ThemeBrightness.dark,
      act: (sut) {
        when(mockUpdateTheme(any)).thenAnswer(
            (_) async => Left(AppError(AppErrorType.database, 'error')));
        when(mockGetPreferredTheme(any)).thenAnswer((_) async => Right('dark'));
        sut.toggleTheme();
      },
      expect: () => const <ThemeBrightness>[],
    );
  });
}
