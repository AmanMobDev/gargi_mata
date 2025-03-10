import '../model/response/samagri_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class SamagriDataSource {
  Stream<List<SamagriResponseModel>> getSamagriResponseData();
}
