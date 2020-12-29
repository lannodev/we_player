import 'package:flutter/material.dart' show Widget;
import 'package:flutter_modular/flutter_modular.dart';
import 'library_controller.dart';
import 'library_page.dart';

class LibraryModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LibraryController()),
      ];

  static Inject get to => Inject<LibraryModule>.of();

  @override
  Widget get view => LibraryPage();
}
