import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/vidhi/data/data_source/vidhi_data_source.dart';
import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class VidhiDataSourceImp implements VidhiDataSource {
  final DataBaseCollectionServices dbService;
  VidhiDataSourceImp({required this.dbService});
  @override
  Stream<List<VidhiResponseModel>> fetchVidhiList() {
    return dbService.readData('vidhi').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return VidhiResponseModel.fromJson(data);
      }).toList();
    });
  }
}
