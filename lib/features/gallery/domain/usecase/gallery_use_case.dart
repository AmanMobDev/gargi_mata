import 'package:gargi_mata/features/gallery/data/repository/gallery_data_repository.dart';

import '../../data/model/response/gallery_response_model.dart';

class GetGalleryUseCase {
  final GalleryDataRepository galleryDataRepository;
  GetGalleryUseCase({required this.galleryDataRepository});
  Stream<List<GalleryResponseModel>> call() {
    return galleryDataRepository.getDomainRepository();
  }
}
