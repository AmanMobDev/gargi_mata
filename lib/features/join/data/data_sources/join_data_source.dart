import '../model/response/join_response_model.dart';

abstract class JoinDataSource {
  Stream<List<JoinResponseModel>> getJoinData();
}
