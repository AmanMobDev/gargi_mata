import 'package:gargi_mata/features/mantra/data/repository/mantra_data_repository.dart';

import '../../data/model/request/mantra_response_model.dart';

class GetMantraUseCase {
  final MantraDataRepository mantraDataRepository;
  GetMantraUseCase({required this.mantraDataRepository});
  Stream<List<MantraResponseModel>> call() {
    return mantraDataRepository.getMantraDomainRepository();
  }
}
