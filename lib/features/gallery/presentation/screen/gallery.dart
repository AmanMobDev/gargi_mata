import '../../../../config/exports/app_export.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Map<String, dynamic>> galleryImages = [
    {
      "date": "27 Feb 2025",
      "images": [
        "assets/images/gargi.jpeg",
        "assets/images/image1.jpeg",
        "assets/images/image2.jpeg",
        "assets/images/image3.jpeg",
      ],
    },
    {
      "date": "25 Feb 2025",
      "images": ["assets/images/image4.jpeg", "assets/images/image5.jpeg"],
    },
  ];

  // late VideoPlayerController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   playVideo();
  // }
  //
  // Future<void> playVideo() async {
  //   try {
  //     _controller = VideoPlayerController.asset("assets/videos/IMG_0537.mp4")
  //       ..initialize().then((_) {
  //         setState(() {});
  //         _controller.play();
  //       });
  //   } catch (e) {
  //     debugPrint("Error loading video: $e");
  //     // Attempt to re-initialize the video
  //     Future.delayed(Duration(seconds: 1), () => playVideo());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
        itemCount: galleryImages.length,
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
                  galleryImages[outerIndex]["date"].toString(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
               // SizedBox(height: 10.0),
                GridView.builder(
                  itemCount: galleryImages[outerIndex]["images"].length,
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
                          galleryImages[outerIndex]["images"][innerIndex]
                              .toString(),
                        );
                        Navigator.pushNamed(
                          context,
                          RouteName.photoViewScreen,
                          arguments: {
                            'image':
                                galleryImages[outerIndex]["images"][innerIndex]
                                    .toString(),
                          },
                        );
                      },
                      child: Card(
                        elevation: 5.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.asset(
                          galleryImages[outerIndex]["images"][innerIndex],
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
      ),
    );
  }

  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
