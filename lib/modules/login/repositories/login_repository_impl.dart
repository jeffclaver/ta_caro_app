import 'package:tacaroapp/modules/login/repositories/login_repository.dart';
import 'package:tacaroapp/shared/models/user_model.dart';
import 'package:tacaroapp/shared/services/app_database.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AppDataBase dataBase;

  LoginRepositoryImpl({
    required this.dataBase,
  });
  @override
  Future<UserModel> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    final response = await dataBase.createAccount(
        name: name, email: email, password: password);
    return response;
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await dataBase.login(email: email, password: password);
    return response;
  }
}
