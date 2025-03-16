import 'package:gargi_mata/features/vidhi/domain/entities/vidhi_entity.dart';

class VidhiResponseModel extends VidhiEntity {
  VidhiResponseModel({required super.title, required super.description});
  factory VidhiResponseModel.fromJson(Map<String, dynamic> json) {
    return VidhiResponseModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
