import 'package:mobx/mobx.dart';

part 'library_controller.g.dart';

class LibraryController = _LibraryControllerBase with _$LibraryController;

abstract class _LibraryControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
