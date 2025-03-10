import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/samagri/data/data_source/samagri_data_source.dart';
import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class SamagriDataSourceImp implements SamagriDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  SamagriDataSourceImp({required this.dataBaseCollectionServices});
  @override
  Stream<List<SamagriResponseModel>> getSamagriResponseData() {
    return dataBaseCollectionServices.readData('samagri').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return SamagriResponseModel.fromJson(data);
      }).toList();
    });
  }
}
