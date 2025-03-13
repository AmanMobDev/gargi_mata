import '../model/request/mantra_response_model.dart';

abstract class MantraDataSource {
  Stream<List<MantraResponseModel>> getMantraData();
}
