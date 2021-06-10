import 'package:login/internal_storage.dart';
// ignore: unused_import
import 'package:login/secure_storage_adapter.dart';
import 'package:login/shared_preferences_adapter.dart';

class FormModel {
  String? name;
  String? surname;
  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void saveUser() {
    if (name == null) return;
    if (surname == null) return;
    return internalStorage.saveUser(name!, surname!);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}
