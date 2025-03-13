import 'package:gargi_mata/features/gallery/data/model/response/gallery_response_model.dart';

abstract class GalleryDomainRepository {
  Stream<List<GalleryResponseModel>> getDomainRepository();
}
