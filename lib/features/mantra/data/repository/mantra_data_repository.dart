import 'package:gargi_mata/features/mantra/data/data_source/mantra_data_source.dart';
import 'package:gargi_mata/features/mantra/data/model/request/mantra_response_model.dart';

import '../../domain/repository/mantra_domain_repository.dart';

class MantraDataRepository implements MantraDomainRepository {
  final MantraDataSource mantraDataSource;
  MantraDataRepository({required this.mantraDataSource});

  @override
  Stream<List<MantraResponseModel>> getMantraDomainRepository() {
    return mantraDataSource.getMantraData();
  }
}
