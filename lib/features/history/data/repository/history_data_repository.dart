import 'package:gargi_mata/features/history/data/data_source/history_data_source.dart';
import 'package:gargi_mata/features/history/domain/repository/history_domain_repository.dart';

import '../model/response/history_response_model.dart';

class HistoryDataRepository implements HistoryDomainRepository {
  final HistoryDataSource historyDataSource;
  HistoryDataRepository({required this.historyDataSource});

  @override
  Stream<List<HistoryResponseModel>> getHistory() {
    return historyDataSource.getDataHistory();
  }
}
