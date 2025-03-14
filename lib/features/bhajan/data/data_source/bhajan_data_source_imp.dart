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
  Future<List<BhajanResponseModel>> getBhajanList() async {
    try {
      final snapshot = await dataBaseCollectionServices.getData('bhajan');

      List<BhajanResponseModel> audioList =
          snapshot.docs
              .map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return BhajanResponseModel.fromJson(data);
              })
              .toList()
              .cast<BhajanResponseModel>();

      return audioList;
    } catch (e) {
      debugPrint("Firestore Fetch Error: $e");
      return []; // ✅ Return an empty list instead of throwing
    }
  }
}
