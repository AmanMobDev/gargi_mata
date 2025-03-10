import '../../data/model/response/daan_response_model.dart';

abstract class DaanDomainRepository {
  Stream<List<DaanResponseModel>> getDaanDataRepository();
}
