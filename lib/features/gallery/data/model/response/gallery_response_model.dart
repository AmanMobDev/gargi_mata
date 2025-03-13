import 'package:gargi_mata/features/gallery/domain/entities/gallery_entity.dart';

class GalleryResponseModel extends GalleryEntity {
  GalleryResponseModel({required super.date, required super.images});

  // Convert Firestore Document to Model
  factory GalleryResponseModel.fromMap(Map<String, dynamic> map) {
    return GalleryResponseModel(
      date: map['date'],
      images: List<String>.from(map['images']),
    );
  }

  // Convert Model to Firestore Map
  Map<String, dynamic> toMap() {
    return {'date': date, 'images': images};
  }
}
