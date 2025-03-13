import 'package:gargi_mata/features/mantra/domain/entities/mantra_entity.dart';

class MantraResponseModel extends MantraEntity {
  MantraResponseModel({required super.title, required super.mantra});

  factory MantraResponseModel.fromJson(Map<String, dynamic> json) {
    return MantraResponseModel(title: json['title'], mantra: json['mantra']);
  }
}
