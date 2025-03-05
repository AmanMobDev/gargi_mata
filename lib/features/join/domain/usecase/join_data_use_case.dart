import 'package:gargi_mata/features/join/data/model/response/join_response_model.dart';

import '../repository/join_repository.dart';

class JoinDataUseCase {
  final JoinDataRepository joinDataRepository;
  JoinDataUseCase({required this.joinDataRepository});

  Future<List<JoinResponseModel>> execute() async {
    return await joinDataRepository.getJoinDataRepository();
  }
}
