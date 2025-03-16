import 'package:gargi_mata/features/vidhi/data/data_source/vidhi_data_source_imp.dart';
import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';
import 'package:gargi_mata/features/vidhi/domain/repository/vidhi_domain_repository.dart';

class VidhiDataRepository implements VidhiDomainRepository {
  final VidhiDataSourceImp vidhiDataSourceImp;
  VidhiDataRepository({required this.vidhiDataSourceImp});
  @override
  Stream<List<VidhiResponseModel>> getVidhiList() {
    return vidhiDataSourceImp.fetchVidhiList();
  }
}
