import 'package:equatable/equatable.dart';

abstract class GalleryEvents extends Equatable {
  const GalleryEvents();
  @override
  List<Object> get props => [];
}

class GetGalleryEvents extends GalleryEvents {
  GetGalleryEvents();
}
