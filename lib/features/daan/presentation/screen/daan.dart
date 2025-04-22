import 'package:qr_flutter/qr_flutter.dart';

import '../../../../config/exports/app_export.dart';

/// *****************************************************************************
///Created By Aman Mishra
///****************************************************************************
class DaanScreen extends StatefulWidget {
  const DaanScreen({super.key});

  @override
  State<DaanScreen> createState() => _DaanScreenState();
}

class _DaanScreenState extends State<DaanScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DaanBloc>().daanDataUseCase();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "दान पात्र",
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: StreamBuilder<List<DaanResponseModel>>(
          stream: context.read<DaanBloc>().daanDataUseCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              final daanDataList = snapshot.data!;
              return ListView.builder(
                itemCount: daanDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    spacing: 35.0,
                    children: [
                      Center(
                        child: Card(
                          elevation: 5.0,
                          margin: const EdgeInsets.only(top: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: AppColor.whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              //vertical: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              spacing: 15.0,
                              children: [
                                SizedBox(height: 8.0),
                                Text(
                                  daanDataList[index].accountHolderName
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                QrImageView(
                                  data: daanDataList[index].qr.toString(),
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),

                                Row(
                                  spacing: 6.0,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "UPI ID:",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      daanDataList[index].upi.toString(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<DaanBloc>()
                                            .copyToClipboard(
                                              text:
                                                  daanDataList[index].upi
                                                      .toString(),
                                              context: context,
                                            );
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 18.0,
                                        color: AppColor.backgroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
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
                                      daanDataList[index].accountNumber
                                          .toString(),
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
                                      daanDataList[index].accountHolderName
                                          .toString(),
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
                                      daanDataList[index].accountIFCSCode
                                          .toString(),
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
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
