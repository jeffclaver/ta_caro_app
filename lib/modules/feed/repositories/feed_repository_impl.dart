import 'package:tacaroapp/modules/feed/repositories/feed_repository.dart';
import 'package:tacaroapp/shared/models/order_model.dart';
import 'package:tacaroapp/shared/services/app_database.dart';

class FeedRepositoryImpl implements FeedRepository {
  final AppDataBase database;

  FeedRepositoryImpl({required this.database});
  @override
  Future<List<OrderModel>> getAll() async {
    final response = await database.getAll("orders");
    return response.map((e) => OrderModel.fromMap(e)).toList();
  }
}
