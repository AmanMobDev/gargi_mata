import '../../exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class DataBaseCollectionServices extends BaseDataBaseServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future addData(String? collectionName, data) async {
    try {
      await _firebaseFirestore.collection(collectionName!).add(data);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on Exception catch (e) {
      Utils.printExceptionLogs(data: e.toString());
    }
  }

  @override
  Future deleteData(String docId, String? collectionName) async {
    try {
      await _firebaseFirestore.collection(collectionName!).doc(docId).delete();
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on Exception catch (e) {
      Utils.printExceptionLogs(data: e.toString());
    }
  }

  @override
  Stream<QuerySnapshot> readData(String collectionName) {
    dynamic responseData;
    try {
      responseData = _firebaseFirestore.collection(collectionName).snapshots();
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on Exception catch (e) {
      Utils.printExceptionLogs(data: e.toString());
    }
    return responseData;
  }

  @override
  Future updateData(String docId, String? collectionName, data) async {
    try {
      await _firebaseFirestore
          .collection(collectionName!)
          .doc(docId)
          .update(data);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on Exception catch (e) {
      Utils.printExceptionLogs(data: e.toString());
    }
  }
}
