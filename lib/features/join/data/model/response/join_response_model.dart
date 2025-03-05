import '../../../domain/entities/join_data.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class JoinResponseModel extends JoinData {
  JoinResponseModel({
    required super.qrData,
    required super.whatsappLink,
    required super.email,
    required super.mobile,
  });

  factory JoinResponseModel.fromJson(Map<String, dynamic> json) =>
      JoinResponseModel(
        qrData: json["qr"],
        whatsappLink: json["link"],
        email: json["email"],
        mobile: json["mobile"],
      );
}
