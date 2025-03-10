import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/daan/data/repository/daan_data_repository.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class DaanUseCase {
  DaanDataRepository daanDataRepository;
  DaanUseCase({required this.daanDataRepository});
  Stream<List<DaanResponseModel>> call() {
    return daanDataRepository.getDaanDataRepository();
  }
}
