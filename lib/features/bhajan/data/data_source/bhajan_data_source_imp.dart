import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';

import 'bhajan_data_source.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class BhajanDataSourceImp implements BhajanDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  BhajanDataSourceImp({required this.dataBaseCollectionServices});
  @override
  Stream<List<BhajanResponseModel>> getBhajanList() {
    return dataBaseCollectionServices.readData('bhajan').map((snapshot) {
      return snapshot.docs.map((doc) {
        final bhajanListData = doc.data() as Map<String, dynamic>;
        return BhajanResponseModel.fromJson(bhajanListData);
      }).toList();
    });
  }
}
