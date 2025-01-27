import 'package:dio/dio.dart';
import 'package:on_point_executions/data/models/user_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/users/{id}")
  Future<UserModel> getUser(@Path("id") int id);
}
