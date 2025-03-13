import 'package:gargi_mata/features/home/data/repository/home_data_repository.dart';

import '../../data/model/response/home_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class HomeUseCase {
  final HomeDataRepository homeDataRepository;
  HomeUseCase({required this.homeDataRepository});
  Stream<List<HomeResponseModel>> call() {
    return homeDataRepository.getDomainFromRepository();
  }
}
