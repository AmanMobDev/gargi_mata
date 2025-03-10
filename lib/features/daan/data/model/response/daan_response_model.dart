import '../../../../../config/exports/app_export.dart';

class DaanResponseModel extends DaanEntities {
  DaanResponseModel({
    required super.qr,
    required super.upi,
    required super.accountHolderName,
    required super.accountNumber,
    required super.accountIFCSCode,
  });

  factory DaanResponseModel.fromJson(Map<String, dynamic> json) =>
      DaanResponseModel(
        qr: json["qr_data"],
        upi: json["upi"],
        accountHolderName: json["account_holder_name"],
        accountNumber: json["account_number"],
        accountIFCSCode: json["ifsc_code"],
      );
}
