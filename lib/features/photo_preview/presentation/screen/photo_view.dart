import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class PhotoViewScreen extends StatefulWidget {
  const PhotoViewScreen({super.key});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  @override
  Widget build(BuildContext context) {
    final imageURL =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;

    debugPrint("ImageURL${imageURL.toString()}");
    return CommonScreen(
      appTitle: "",
      child: Container(
        child:
            imageURL['image'] == null
                ? Center(child: Text("No Image"))
                : Center(
                  child: Image.network(
                    imageURL['image'].toString(),
                    fit: BoxFit.fill,
                    scale: 1.0,
                  ),
                ),
      ),
    );
  }
}
