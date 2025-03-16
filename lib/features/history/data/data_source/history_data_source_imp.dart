import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/history/data/data_source/history_data_source.dart';

import '../model/response/history_response_model.dart';

class HistoryDataSourceImp implements HistoryDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  HistoryDataSourceImp({required this.dataBaseCollectionServices});

  @override
  Stream<List<HistoryResponseModel>> getDataHistory() {
    return dataBaseCollectionServices.readData("history").map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return HistoryResponseModel.fromJson(data);
      }).toList();
    });
  }
}
