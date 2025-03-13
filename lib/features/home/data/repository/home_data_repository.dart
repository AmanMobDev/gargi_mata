import 'package:gargi_mata/features/home/data/data_source/home_data_source.dart';
import 'package:gargi_mata/features/home/data/model/response/home_response_model.dart';

import '../../domain/repository/home_domain_repository.dart';

class HomeDataRepository implements HomeDomainRepository {
  final HomeDataSource homeDataSource;

  HomeDataRepository({required this.homeDataSource});
  @override
  Stream<List<HomeResponseModel>> getDomainFromRepository() {
    return homeDataSource.getDataFromDataSource();
  }
}
