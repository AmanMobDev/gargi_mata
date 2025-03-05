import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class JoinDataRepositoryImpl implements JoinDataRepository {
  final JoinDataSource joinDataSource;
  JoinDataRepositoryImpl({required this.joinDataSource});

  @override
  Future<List<JoinResponseModel>> getJoinDataRepository() {
    return joinDataSource.getJoinData();
  }
}
