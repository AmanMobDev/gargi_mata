import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';
import 'package:gargi_mata/features/samagri/data/repository/samagri_data_repository.dart';

class SamagriUseCase {
  final SamagriDataRepository samagriDataRepository;
  SamagriUseCase({required this.samagriDataRepository});

  Stream<List<SamagriResponseModel>> call() {
    return samagriDataRepository.getSamagriData();
  }
}
