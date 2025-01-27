

import 'dart:collection';

import 'package:on_point_executions/core/network/api_client.dart';
import 'package:on_point_executions/data/models/user_model.dart';
import 'package:on_point_executions/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(ApiClient apiClient);

  @override
  Future<UserModel> getUser(int id) {

    throw UnimplementedError();
  }



}