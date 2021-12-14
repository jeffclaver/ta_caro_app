import 'package:tacaroapp/shared/models/order_model.dart';

abstract class FeedRepository {
  Future<List<OrderModel>> getAll();
}
