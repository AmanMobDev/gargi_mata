import '../model/response/gallery_response_model.dart';

abstract class GalleryDataSource {
  Stream<List<GalleryResponseModel>> getGalleryData();
}
