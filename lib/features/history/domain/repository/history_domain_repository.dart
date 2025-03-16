import 'package:gargi_mata/features/history/data/model/response/history_response_model.dart';

abstract class HistoryDomainRepository {
  Stream<List<HistoryResponseModel>> getHistory();
}
