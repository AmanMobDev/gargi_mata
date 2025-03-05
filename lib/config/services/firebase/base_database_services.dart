abstract class BaseDataBaseServices {
  Future<dynamic> addData(String? collectionName, dynamic data);

  //Future<dynamic> readData(String collectionName);

  Stream<dynamic> readData(String collectionName);

  Future<dynamic> updateData(
    String docId,
    String? collectionName,
    dynamic data,
  );

  Future<dynamic> deleteData(String docId, String? collectionName);
}
