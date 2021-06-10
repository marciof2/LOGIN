import 'package:login/model.dart';

class FormController {
  final model = FormModel();

  String get name => model.name ?? '';
  String get surname => model.surname ?? '';
  Future<String> get fullName => model.getFullName();

  void updateName(String name) {
    model.name = name;
    print(model.name);
  }

  void updatesurName(String surname) {
    model.surname = surname;
    print(model.surname);
  }

  void saveUser() {
    model.saveUser();
  }
}
