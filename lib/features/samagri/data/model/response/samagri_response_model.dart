import 'package:gargi_mata/features/samagri/domain/entities/samagri_entities.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class SamagriResponseModel extends SamagriEntities {
  SamagriResponseModel({
    required super.item,
    required super.unit,
    required super.weight,
  });

  factory SamagriResponseModel.fromJson(Map<String, dynamic> json) =>
      SamagriResponseModel(
        item: json["item"],
        unit: json["unit"],
        weight: json["weight"],
      );
}
