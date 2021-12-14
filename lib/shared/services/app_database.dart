import 'package:tacaroapp/shared/models/user_model.dart';
import 'package:tacaroapp/shared/services/supabase_database.dart';

abstract class AppDataBase {
  static final AppDataBase instance = SupabaseDatabase();
  void init();
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUser(String id);
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> createAccount({
    required String name,
    required String email,
    required String password,
  });
  Future<List<Map<String, dynamic>>> getAll(String table);
  Future<bool> create(
      {required String table, required Map<String, dynamic> data});
}
