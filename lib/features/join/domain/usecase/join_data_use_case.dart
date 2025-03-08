import 'package:gargi_mata/features/join/data/model/response/join_response_model.dart';

import '../../data/repository/join_data_repository.dart';

class GetJoinDataUseCase {
  final JoinDataRepository repository;

  GetJoinDataUseCase({required this.repository});

  Stream<List<JoinResponseModel>> call() {
    return repository.getJoinData();
  }
}

// class JoinDataUseCase {
//   final JoinDataRepository joinDataRepository;
//   JoinDataUseCase({required this.joinDataRepository});
//
//   Stream<List<JoinResponseModel>> execute() {
//     return joinDataRepository.callJoinData();
//   }
// }
