import 'package:gargi_mata/features/history/data/repository/history_data_repository.dart';

import '../../data/model/response/history_response_model.dart';

class GetHistoryUseCase {
  final HistoryDataRepository historyDataRepository;
  GetHistoryUseCase({required this.historyDataRepository});
  Stream<List<HistoryResponseModel>> call() {
    return historyDataRepository.getHistory();
  }
}
