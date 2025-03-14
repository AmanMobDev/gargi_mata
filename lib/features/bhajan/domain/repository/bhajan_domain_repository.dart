import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';

abstract class BhajanDomainRepository {
  Future<List<BhajanResponseModel>> getBhajanDomainRepository();
}
