import 'package:gargi_mata/features/bhajan/data/repository/bhajan_data_repository.dart';

import '../../data/model/bhajan_response_model.dart';

class GetBhajanUseCase {
  final BhajanDataRepository bhajanDataRepository;
  GetBhajanUseCase({required this.bhajanDataRepository});
  Stream<List<BhajanResponseModel>> call() {
    return bhajanDataRepository.getBhajanDomainRepository();
  }
}
