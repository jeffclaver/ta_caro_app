import 'package:flutter/material.dart';

import 'package:tacaroapp/modules/login/repositories/login_repository.dart';
import 'package:tacaroapp/shared/models/user_model.dart';
import 'package:tacaroapp/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepository repository;
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";
  CreateAccountController({
    required this.repository,
  });

  void onChanged({String? name, String? email, String? password}) {
    _name = name ?? _name;
    _email = email ?? _email;
    _password = password ?? _password;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.createAccount(
            name: _name, password: _password, email: _email);
        update(AppState.success<UserModel>(response));
      } on Exception catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
