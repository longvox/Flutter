// Mocks generated by Mockito 5.4.5 from annotations
// in flutter_getx_boilerplate/test/modules/auths/auth_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_getx_boilerplate/api/api.dart' as _i2;
import 'package:flutter_getx_boilerplate/models/models.dart' as _i4;
import 'package:flutter_getx_boilerplate/models/response/users_response.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/src/shared_preferences_legacy.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiProvider_0 extends _i1.SmartFake implements _i2.ApiProvider {
  _FakeApiProvider_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [ApiRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiRepository extends _i1.Mock implements _i2.ApiRepository {
  MockApiRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ApiProvider get apiProvider => (super.noSuchMethod(
        Invocation.getter(#apiProvider),
        returnValue: _FakeApiProvider_0(
          this,
          Invocation.getter(#apiProvider),
        ),
      ) as _i2.ApiProvider);

  @override
  _i3.Future<_i4.LoginResponse?> login(_i4.LoginRequest? data) =>
      (super.noSuchMethod(
        Invocation.method(#login, [data]),
        returnValue: _i3.Future<_i4.LoginResponse?>.value(),
      ) as _i3.Future<_i4.LoginResponse?>);

  @override
  _i3.Future<_i4.RegisterResponse?> register(_i4.RegisterRequest? data) =>
      (super.noSuchMethod(
        Invocation.method(#register, [data]),
        returnValue: _i3.Future<_i4.RegisterResponse?>.value(),
      ) as _i3.Future<_i4.RegisterResponse?>);

  @override
  _i3.Future<_i5.UsersResponse?> getUsers() => (super.noSuchMethod(
        Invocation.method(#getUsers, []),
        returnValue: _i3.Future<_i5.UsersResponse?>.value(),
      ) as _i3.Future<_i5.UsersResponse?>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i6.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(
        Invocation.method(#getKeys, []),
        returnValue: <String>{},
      ) as Set<String>);

  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);

  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);

  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);

  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);

  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);

  @override
  bool containsKey(String? key) => (super.noSuchMethod(
        Invocation.method(#containsKey, [key]),
        returnValue: false,
      ) as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);

  @override
  _i3.Future<bool> setBool(String? key, bool? value) => (super.noSuchMethod(
        Invocation.method(#setBool, [key, value]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setInt(String? key, int? value) => (super.noSuchMethod(
        Invocation.method(#setInt, [key, value]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setDouble(String? key, double? value) => (super.noSuchMethod(
        Invocation.method(#setDouble, [key, value]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setString(String? key, String? value) => (super.noSuchMethod(
        Invocation.method(#setString, [key, value]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(
        Invocation.method(#setStringList, [key, value]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> remove(String? key) => (super.noSuchMethod(
        Invocation.method(#remove, [key]),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> commit() => (super.noSuchMethod(
        Invocation.method(#commit, []),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<bool> clear() => (super.noSuchMethod(
        Invocation.method(#clear, []),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<void> reload() => (super.noSuchMethod(
        Invocation.method(#reload, []),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}