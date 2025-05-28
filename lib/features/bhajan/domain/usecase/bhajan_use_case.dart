import '../../../../config/exports/app_export.dart';

class GetBhajanUseCase {
  final BhajanDataRepository bhajanDataRepository;
  GetBhajanUseCase({required this.bhajanDataRepository});
  Future<List<BhajanResponseModel>> call() {
    return bhajanDataRepository.getBhajanDomainRepository();
  }
}
