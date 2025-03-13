import 'package:gargi_mata/features/home/data/model/response/home_response_model.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
abstract class HomeDataSource {
  Stream<List<HomeResponseModel>> getDataFromDataSource();
}
