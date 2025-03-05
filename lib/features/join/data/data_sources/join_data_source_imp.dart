import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../config/services/firebase/database_services.dart';
import '../model/response/join_response_model.dart';
import 'join_data_source.dart';

class JoinDataSourceImp implements JoinDataSource {
  final DataBaseCollectionServices services;

  JoinDataSourceImp({required this.services});

  @override
  Future<List<JoinResponseModel>> getJoinData() async {
    // Await for the data properly
    final QuerySnapshot snapshot = await services.readData("join").first;

    // Convert Firestore documents to List<Map<String, dynamic>>
    final List<JoinResponseModel> joinData =
        snapshot.docs
            .map(
              (doc) => JoinResponseModel.fromJson(
                doc.data() as Map<String, dynamic>,
              ),
            )
            .toList();

    return joinData;
  }
}
