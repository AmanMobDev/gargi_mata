import 'package:gargi_mata/config/exports/app_export.dart';
import 'package:gargi_mata/features/home/data/data_source/home_data_source.dart';
import 'package:gargi_mata/features/home/data/model/response/home_response_model.dart';

class HomeDataSourceImp implements HomeDataSource {
  final DataBaseCollectionServices services;

  HomeDataSourceImp({required this.services});

  @override
  Stream<List<HomeResponseModel>> getDataFromDataSource() {
    return services.readData('home').map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        //debugPrint("Data ::::::::::${data.toString()}");
        return HomeResponseModel.fromJson(data);
      }).toList();
    });
  }
}
