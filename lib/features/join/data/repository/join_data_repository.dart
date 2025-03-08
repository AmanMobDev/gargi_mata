import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class JoinDataRepository implements JoinDomainRepository {
  final JoinDataSource joinDataSource;
  JoinDataRepository({required this.joinDataSource});

  @override
  Stream<List<JoinResponseModel>> getJoinData() {
    return joinDataSource.getJoinData();
  }
}
