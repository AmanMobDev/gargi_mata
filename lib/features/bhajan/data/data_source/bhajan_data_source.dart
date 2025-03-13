import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';

abstract class BhajanDataSource {
  Stream<List<BhajanResponseModel>> getBhajanList();
}
