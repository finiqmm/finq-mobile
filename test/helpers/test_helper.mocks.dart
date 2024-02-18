// Mocks generated by Mockito 5.4.4 from annotations
// in finq/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:bloc/bloc.dart' as _i12;
import 'package:dartz/dartz.dart' as _i3;
import 'package:finq/domain/entities/app_error.dart' as _i9;
import 'package:finq/domain/entities/article_entity.dart' as _i13;
import 'package:finq/domain/entities/no_params.dart' as _i10;
import 'package:finq/domain/entities/user_entity.dart' as _i11;
import 'package:finq/domain/repositories/application_repository.dart' as _i2;
import 'package:finq/domain/repositories/article_repository.dart' as _i6;
import 'package:finq/domain/repositories/authentication_repository.dart' as _i4;
import 'package:finq/domain/usecases/use_case_imports.dart' as _i7;
import 'package:finq/presentation/bloc/pincode/pincode_cubit.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApplicationRepository_0 extends _i1.SmartFake
    implements _i2.ApplicationRepository {
  _FakeApplicationRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthenticationRepository_2 extends _i1.SmartFake
    implements _i4.AuthenticationRepository {
  _FakeAuthenticationRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePincodeState_3 extends _i1.SmartFake implements _i5.PincodeState {
  _FakePincodeState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeArticleRepository_4 extends _i1.SmartFake
    implements _i6.ArticleRepository {
  _FakeArticleRepository_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetPreferredTheme].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPreferredTheme extends _i1.Mock implements _i7.GetPreferredTheme {
  MockGetPreferredTheme() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApplicationRepository get appRepository => (super.noSuchMethod(
        Invocation.getter(#appRepository),
        returnValue: _FakeApplicationRepository_0(
          this,
          Invocation.getter(#appRepository),
        ),
      ) as _i2.ApplicationRepository);

  @override
  _i8.Future<_i3.Either<_i9.AppError, String>> call(_i10.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<_i3.Either<_i9.AppError, String>>.value(
            _FakeEither_1<_i9.AppError, String>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, String>>);
}

/// A class which mocks [UpdateTheme].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateTheme extends _i1.Mock implements _i7.UpdateTheme {
  MockUpdateTheme() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApplicationRepository get appRepository => (super.noSuchMethod(
        Invocation.getter(#appRepository),
        returnValue: _FakeApplicationRepository_0(
          this,
          Invocation.getter(#appRepository),
        ),
      ) as _i2.ApplicationRepository);

  @override
  _i8.Future<_i3.Either<_i9.AppError, void>> call(String? themeName) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [themeName],
        ),
        returnValue: _i8.Future<_i3.Either<_i9.AppError, void>>.value(
            _FakeEither_1<_i9.AppError, void>(
          this,
          Invocation.method(
            #call,
            [themeName],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, void>>);
}

/// A class which mocks [CheckIfFirstTimeUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckIfFirstTimeUser extends _i1.Mock
    implements _i7.CheckIfFirstTimeUser {
  MockCheckIfFirstTimeUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i3.Either<_i9.AppError, bool>> call(_i10.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<_i3.Either<_i9.AppError, bool>>.value(
            _FakeEither_1<_i9.AppError, bool>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, bool>>);
}

/// A class which mocks [GetSignedInUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSignedInUser extends _i1.Mock implements _i7.GetSignedInUser {
  MockGetSignedInUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AuthenticationRepository get authRepo => (super.noSuchMethod(
        Invocation.getter(#authRepo),
        returnValue: _FakeAuthenticationRepository_2(
          this,
          Invocation.getter(#authRepo),
        ),
      ) as _i4.AuthenticationRepository);

  @override
  _i8.Future<_i3.Either<_i9.AppError, _i11.UserEntity>> call(
          _i10.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i8.Future<_i3.Either<_i9.AppError, _i11.UserEntity>>.value(
                _FakeEither_1<_i9.AppError, _i11.UserEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, _i11.UserEntity>>);
}

/// A class which mocks [SignOut].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignOut extends _i1.Mock implements _i7.SignOut {
  MockSignOut() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AuthenticationRepository get authRepo => (super.noSuchMethod(
        Invocation.getter(#authRepo),
        returnValue: _FakeAuthenticationRepository_2(
          this,
          Invocation.getter(#authRepo),
        ),
      ) as _i4.AuthenticationRepository);

  @override
  _i8.Future<_i3.Either<_i9.AppError, void>> call(_i10.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8.Future<_i3.Either<_i9.AppError, void>>.value(
            _FakeEither_1<_i9.AppError, void>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, void>>);
}

/// A class which mocks [PincodeCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockPincodeCubit extends _i1.Mock implements _i5.PincodeCubit {
  MockPincodeCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.PincodeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakePincodeState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.PincodeState);

  @override
  _i8.Stream<_i5.PincodeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i5.PincodeState>.empty(),
      ) as _i8.Stream<_i5.PincodeState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void save(String? value) => super.noSuchMethod(
        Invocation.method(
          #save,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void isAppLocked() => super.noSuchMethod(
        Invocation.method(
          #isAppLocked,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void isPasscodeMatch(String? value) => super.noSuchMethod(
        Invocation.method(
          #isPasscodeMatch,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void remove(String? value) => super.noSuchMethod(
        Invocation.method(
          #remove,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i5.PincodeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i12.Change<_i5.PincodeState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);
}

/// A class which mocks [GetArticle].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetArticle extends _i1.Mock implements _i7.GetArticle {
  MockGetArticle() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.ArticleRepository get articleRepository => (super.noSuchMethod(
        Invocation.getter(#articleRepository),
        returnValue: _FakeArticleRepository_4(
          this,
          Invocation.getter(#articleRepository),
        ),
      ) as _i6.ArticleRepository);

  @override
  _i8.Future<_i3.Either<_i9.AppError, List<_i13.ArticleEntity>>> call(
          _i10.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i8
            .Future<_i3.Either<_i9.AppError, List<_i13.ArticleEntity>>>.value(
            _FakeEither_1<_i9.AppError, List<_i13.ArticleEntity>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i8.Future<_i3.Either<_i9.AppError, List<_i13.ArticleEntity>>>);
}
