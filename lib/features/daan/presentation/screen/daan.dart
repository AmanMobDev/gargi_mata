import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class DaanScreen extends StatefulWidget {
  const DaanScreen({Key? key}) : super(key: key);

  @override
  State<DaanScreen> createState() => _DaanScreenState();
}

class _DaanScreenState extends State<DaanScreen> {
  //Future<List<ApplicationMeta>>? _appsFuture;

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  void initState() {
    super.initState();
    // _appsFuture = UpiPay.getInstalledUpiApplications();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "",
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          spacing: 30.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              spacing: 10.0,
              children: [
                Center(
                  child: Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.only(top: 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: AppColor.whiteColor,
                    child: Image.asset(
                      'assets/images/qr.jpeg',
                      fit: BoxFit.contain,
                      width: 250.0,
                      height: 250.0,
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      spacing: 5.0,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "UPI: daanpart@icici",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            copyToClipboard("daanpart@icici");
                          },
                          icon: const Icon(
                            Icons.copy,
                            size: 14.0,
                            color: AppColor.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            //   child: Text(
            //     "UPI Apps",
            //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            //   ),
            // ),

            //        FutureBuilder<List<ApplicationMeta>>(
            //          future: _appsFuture,
            //          builder: (context, snapshot) {
            //            if (snapshot.hasData) {
            //              List<ApplicationMeta>? apps = snapshot.data;
            // debugPrint(apps.toString());
            //              return SizedBox(
            //                height: 150.0,
            //                child: ListView.builder(
            //                  itemCount: apps!.length,
            //                  itemBuilder: (context, index) {
            //                    final app = apps[index];
            //                    return ListTile(
            //                      // leading: SizedBox( // Added SizedBox to constrain the image size
            //                      //   width: 48,  // Adjust as needed
            //                      //   height: 48, // Adjust as needed
            //                      //   child: Image.memory(
            //                      //     app.upiApplication.appName.toString(),
            //                      //     errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            //                      //       return const Icon(Icons.error); // Show an error icon if the image fails to load
            //                      //     },
            //                      //   ),
            //                      // ),
            //                      title: Text(app.packageName),
            //                      subtitle: Text(app.packageName),
            //                    );
            //                  },
            //                ),
            //              );
            //            } else if (snapshot.hasError) {
            //              return Center(
            //                child: Text("Error: ${snapshot.error}"),
            //              );
            //            } else {
            //              return const Center(
            //                child: CircularProgressIndicator(),
            //              );
            //            }
            //          },
            //        ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 15.0,
                children: [
                  Text(
                    "Account Details",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    spacing: 10.0,
                    children: [
                      Row(
                        spacing: 5.0,
                        children: [
                          Text(
                            "Account Number : ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "4092 890 899 120",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5.0,
                        children: [
                          Text(
                            "Account Holder Name : ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "Gargi Mata",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5.0,
                        children: [
                          Text(
                            "IFSC CODE : ",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "ICICI0009912",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
