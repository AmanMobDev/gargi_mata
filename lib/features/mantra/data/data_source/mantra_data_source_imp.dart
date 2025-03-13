import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/mantra/data/data_source/mantra_data_source.dart';

import '../model/request/mantra_response_model.dart';

class MantraDataSourceImp implements MantraDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  MantraDataSourceImp({required this.dataBaseCollectionServices});
  @override
  Stream<List<MantraResponseModel>> getMantraData() {
    return dataBaseCollectionServices.readData('mantra').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MantraResponseModel.fromJson(data);
      }).toList();
    });
  }
}
