import 'package:gargi_mata/features/mantra/data/model/request/mantra_response_model.dart';

abstract class MantraDomainRepository {
  Stream<List<MantraResponseModel>> getMantraDomainRepository();
}
