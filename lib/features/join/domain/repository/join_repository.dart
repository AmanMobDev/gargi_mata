import 'package:gargi_mata/features/join/data/model/response/join_response_model.dart';

abstract class JoinDataRepository {
  Future<List<JoinResponseModel>> getJoinDataRepository();
}
