abstract class BaseDataBaseServices {
  Future<dynamic> addData(String? collectionName, dynamic data);

  Stream<dynamic> readData(String collectionName);
  Future<dynamic> getData(String collectionName);

  Future<dynamic> updateData(
    String docId,
    String? collectionName,
    dynamic data,
  );

  Future<dynamic> deleteData(String docId, String? collectionName);
}
