import 'package:equatable/equatable.dart';

import '../../data/model/response/gallery_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class GalleryStates extends Equatable {
  const GalleryStates();
  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryStates {
  GalleryInitial();
}

class GalleryLoading extends GalleryStates {
  GalleryLoading();
}

class GalleryLoaded extends GalleryStates {
  final List<GalleryResponseModel> galleryResponseModel;
  GalleryLoaded({required this.galleryResponseModel});
  @override
  List<Object> get props => [galleryResponseModel];
}

class GalleryError extends GalleryStates {
  final String message;
  GalleryError(this.message);
  @override
  List<Object> get props => [message];
}
