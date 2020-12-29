// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LibraryController on _LibraryControllerBase, Store {
  final _$valueAtom = Atom(name: '_LibraryControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_LibraryControllerBaseActionController =
      ActionController(name: '_LibraryControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_LibraryControllerBaseActionController.startAction(
        name: '_LibraryControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LibraryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
