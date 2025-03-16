import 'package:gargi_mata/features/history/domain/entities/history_entity.dart';

class HistoryResponseModel extends HistoryEntity {
  HistoryResponseModel({required super.historyDescription});

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    return HistoryResponseModel(
      historyDescription: json['history_description'],
    );
  }
}
