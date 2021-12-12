import 'package:flutter/material.dart';
import 'package:tacaroapp/shared/utils/app_state.dart';

class CreateLoginController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

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
        await Future.delayed(Duration(seconds: 2));
        update(AppState.success<String>("Criado com sucesso"));
      } on Exception catch (e) {
        update(AppState.error("Não foi possível cadastrar conta"));
      }
    }
  }
}
