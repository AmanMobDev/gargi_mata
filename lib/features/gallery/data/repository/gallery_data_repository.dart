import 'package:gargi_mata/features/gallery/data/data_source/data_source.dart';
import 'package:gargi_mata/features/gallery/data/model/response/gallery_response_model.dart';
import 'package:gargi_mata/features/gallery/domain/repository/gallery_domain_repository.dart';

class GalleryDataRepository implements GalleryDomainRepository {
  final GalleryDataSource galleryDataSource;
  GalleryDataRepository({required this.galleryDataSource});

  @override
  Stream<List<GalleryResponseModel>> getDomainRepository() {
    return galleryDataSource.getGalleryData();
  }
}
