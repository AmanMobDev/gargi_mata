import 'package:gargi_mata/features/samagri/data/data_source/samagri_data_source.dart';
import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';
import 'package:gargi_mata/features/samagri/domain/repository/samagri_domain_repository.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class SamagriDataRepository implements SamagriDomainRepository {
  final SamagriDataSource samagriDataSource;
  SamagriDataRepository({required this.samagriDataSource});

  @override
  Stream<List<SamagriResponseModel>> getSamagriData() {
    return samagriDataSource.getSamagriResponseData();
  }
}
