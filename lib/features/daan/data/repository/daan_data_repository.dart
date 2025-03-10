import '../../../../config/exports/app_export.dart';

class DaanDataRepository implements DaanDomainRepository {
  DaanDataSource daanDataSource;
  DaanDataRepository({required this.daanDataSource});

  @override
  Stream<List<DaanResponseModel>> getDaanDataRepository() {
    return daanDataSource.getDaanData();
  }
}
