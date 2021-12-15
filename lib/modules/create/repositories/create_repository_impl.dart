import 'package:tacaroapp/modules/create/repositories/create_repository.dart';
import 'package:tacaroapp/shared/services/app_database.dart';

class CreateRepositoryImpl implements CreateRepository {
  final AppDataBase database;
  CreateRepositoryImpl({
    required this.database,
  });

  @override
  Future<bool> create({
    required String name,
    required String price,
    required String date,
    required String userID,
  }) async {
    final priceSanitize = double.parse(price.replaceAll("R\$", ""));
    final response = await database.create(table: "orders", data: {
      "name": name,
      "price": priceSanitize,
      "created": date,
      "userID": userID
    });
    return response;
  }
}
