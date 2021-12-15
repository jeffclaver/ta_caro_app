import 'package:tacaroapp/shared/models/order_model.dart';
import 'package:tacaroapp/shared/models/user_model.dart';

abstract class FeedRepository {
  Future<List<OrderModel>> getAll();
  Future<List<OrderModel>> getProduct(UserModel user);
}
