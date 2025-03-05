import '../model/response/join_response_model.dart';

abstract class JoinDataSource {
  Future<List<JoinResponseModel>> getJoinData();
}
