import 'package:gargi_mata/features/bhajan/domain/entities/bhajan_entity.dart';

class BhajanResponseModel extends BhajanEntity {
  BhajanResponseModel({required super.fileName, required super.url});

  factory BhajanResponseModel.fromJson(Map<String, dynamic> json) {
    return BhajanResponseModel(fileName: json['file_name'], url: json['url']);
  }
}
