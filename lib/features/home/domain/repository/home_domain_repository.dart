import '../../data/model/response/home_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class HomeDomainRepository {
  Stream<List<HomeResponseModel>> getDomainFromRepository();
}
