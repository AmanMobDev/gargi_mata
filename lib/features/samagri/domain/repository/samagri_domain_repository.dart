import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';

abstract class SamagriDomainRepository {
  Stream<List<SamagriResponseModel>> getSamagriData();
}
