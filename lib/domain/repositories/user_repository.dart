import 'package:on_point_executions/data/models/user_model.dart';


abstract interface class UserRepository {
  Future<UserModel> getUser(int id);
}
