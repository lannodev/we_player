// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$showNavigationBarAtom =
      Atom(name: '_HomeControllerBase.showNavigationBar');

  @override
  bool get showNavigationBar {
    _$showNavigationBarAtom.reportRead();
    return super.showNavigationBar;
  }

  @override
  set showNavigationBar(bool value) {
    _$showNavigationBarAtom.reportWrite(value, super.showNavigationBar, () {
      super.showNavigationBar = value;
    });
  }

  final _$indexPageAtom = Atom(name: '_HomeControllerBase.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  final _$hasConnectionAtom = Atom(name: '_HomeControllerBase.hasConnection');

  @override
  bool get hasConnection {
    _$hasConnectionAtom.reportRead();
    return super.hasConnection;
  }

  @override
  set hasConnection(bool value) {
    _$hasConnectionAtom.reportWrite(value, super.hasConnection, () {
      super.hasConnection = value;
    });
  }

  final _$isPanelVisibleAtom = Atom(name: '_HomeControllerBase.isPanelVisible');

  @override
  bool get isPanelVisible {
    _$isPanelVisibleAtom.reportRead();
    return super.isPanelVisible;
  }

  @override
  set isPanelVisible(bool value) {
    _$isPanelVisibleAtom.reportWrite(value, super.isPanelVisible, () {
      super.isPanelVisible = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setPage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPage');
    try {
      return super.setPage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showNavigationBar: ${showNavigationBar},
indexPage: ${indexPage},
hasConnection: ${hasConnection},
isPanelVisible: ${isPanelVisible}
    ''';
  }
}
