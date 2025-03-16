import 'package:gargi_mata/features/vidhi/data/repository/vidhi_data_repository.dart';

import '../../data/model/response/vidhi_response_model.dart';

class GetVidhiUseCase {
  final VidhiDataRepository vidhiDataRepository;
  GetVidhiUseCase({required this.vidhiDataRepository});
  Stream<List<VidhiResponseModel>> call() {
    return vidhiDataRepository.getVidhiList();
  }
}
