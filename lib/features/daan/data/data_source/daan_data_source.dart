import '../../../../config/exports/app_export.dart';

abstract class DaanDataSource {
  Stream<List<DaanResponseModel>> getDaanData();
}
