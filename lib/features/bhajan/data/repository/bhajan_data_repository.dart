import 'package:gargi_mata/features/bhajan/data/data_source/bhajan_data_source_imp.dart';
import 'package:gargi_mata/features/bhajan/data/model/bhajan_response_model.dart';
import 'package:gargi_mata/features/bhajan/domain/repository/bhajan_domain_repository.dart';

class BhajanDataRepository implements BhajanDomainRepository {
  final BhajanDataSourceImp bhajanDataSourceImp;
  BhajanDataRepository({required this.bhajanDataSourceImp});
  @override
  Future<List<BhajanResponseModel>> getBhajanDomainRepository() {
    return bhajanDataSourceImp.getBhajanList();
  }
}
