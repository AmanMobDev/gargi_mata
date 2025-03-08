import '../../data/model/response/join_response_model.dart';

abstract class JoinDomainRepository {
  Stream<List<JoinResponseModel>> getJoinData();
}
