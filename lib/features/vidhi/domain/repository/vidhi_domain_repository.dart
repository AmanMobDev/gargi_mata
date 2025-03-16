import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';

abstract class VidhiDomainRepository {
  Stream<List<VidhiResponseModel>> getVidhiList();
}
