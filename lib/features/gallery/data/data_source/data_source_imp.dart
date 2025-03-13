import 'package:gargi_mata/config/services/firebase/database_services.dart';
import 'package:gargi_mata/features/gallery/data/data_source/data_source.dart';
import 'package:gargi_mata/features/gallery/data/model/response/gallery_response_model.dart';

class GalleryDataSourceImp implements GalleryDataSource {
  final DataBaseCollectionServices dataBaseCollectionServices;
  GalleryDataSourceImp({required this.dataBaseCollectionServices});

  @override
  Stream<List<GalleryResponseModel>> getGalleryData() {
    return dataBaseCollectionServices.readData('gallery').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return GalleryResponseModel.fromMap(data);
      }).toList();
    });
  }
}
