import 'package:gargi_mata/config/exports/app_export.dart';

class DaanDataSourceImp implements DaanDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  DaanDataSourceImp({required this.dataBaseCollectionServices});

  @override
  Stream<List<DaanResponseModel>> getDaanData() {
    return dataBaseCollectionServices.readData('daan').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return DaanResponseModel.fromJson(data);
      }).toList();
    });
  }
}
