import '../../../../config/exports/app_export.dart';

class JoinDataSourceImp implements JoinDataSource {
  final DataBaseCollectionServices services;

  JoinDataSourceImp({required this.services});

  @override
  Stream<List<JoinResponseModel>> getJoinData() {
    return services.readData("join").map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return JoinResponseModel.fromJson(data);
      }).toList();
    });
  }
}
