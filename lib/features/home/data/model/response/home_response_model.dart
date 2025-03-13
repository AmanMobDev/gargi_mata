/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

import '../../../domain/entities/home_entities.dart';

class HomeResponseModel extends HomeEntities {
  HomeResponseModel({
    required super.eventInfo,
    required super.image,
    required super.name,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      eventInfo: json['event_info'],
      image: json['image'],
      name: json['name'],
    );
  }
}
