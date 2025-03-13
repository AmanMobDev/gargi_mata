import 'package:gargi_mata/features/gallery/data/model/response/gallery_response_model.dart';
import 'package:gargi_mata/features/gallery/presentation/bloc/gallery_bloc.dart';

import '../../../../config/exports/app_export.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder<List<GalleryResponseModel>>(
        stream: context.read<GalleryBloc>().getGalleryUseCase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return customCircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            final galleryDataList = snapshot.data!;
            return ListView.builder(
              itemCount: galleryDataList.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.0,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        galleryDataList[outerIndex].date,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 10.0),
                      GridView.builder(
                        itemCount: galleryDataList[outerIndex].images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, innerIndex) {
                          return GestureDetector(
                            onTap: () {
                              debugPrint(
                                galleryDataList[outerIndex].images[innerIndex]
                                    .toString(),
                              );
                              Navigator.pushNamed(
                                context,
                                RouteName.photoViewScreen,
                                arguments: {
                                  'image':
                                      galleryDataList[outerIndex]
                                          .images[innerIndex]
                                          .toString()
                                          .toString(),
                                },
                              );
                            },
                            child: Card(
                              elevation: 5.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                galleryDataList[outerIndex].images[innerIndex]
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
