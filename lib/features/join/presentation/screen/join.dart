import '../../../../config/exports/app_export.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<JoinBloc>().add(GetJoinEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: StreamBuilder<List<JoinResponseModel>>(
        stream: context.read<JoinBloc>().getJoinDataUseCase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return customCircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            final joinDataList = snapshot.data!;
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemCount: joinDataList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
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
                            mainAxisSize: MainAxisSize.min,
                            spacing: 15.0,
                            children: [
                              SizedBox(height: 8.0),
                              Text(
                                joinDataList[index].qrData.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //
                              //   ],
                              // ),
                              Image.asset(
                                'assets/images/qr.jpeg',
                                scale: 1.0,
                                fit: BoxFit.contain,
                                width: 250.0,
                                height: 250.0,
                              ),

                              GestureDetector(
                                onTap: () {
                                  context.read<JoinBloc>().launchWhatsAppGroup(
                                    joinDataList[index].whatsappLink,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  spacing: 10.0,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/whatsapp.svg',
                                        width: 30.0,
                                        height: 30.0,

                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: 15.0),
                                    CustomTextWidget(
                                      value: "WhatsApp",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.blackColor,
                                    ),
                                    SizedBox(width: 15.0),
                                    Icon(Icons.ios_share, size: 24.0),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Divider(
                      height: 10.0,
                      thickness: 2.0,
                      endIndent: 10.0,
                      indent: 10.0,
                      color: AppColor.backgroundColorWithOpacity,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10.0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<JoinBloc>().launchEmail(
                              joinDataList[index].email.toString(),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10.0,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                color: AppColor.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.email,
                                    size: 30.0,
                                    color: AppColor.backgroundColor,
                                  ),
                                ),
                              ),

                              TextWidget(
                                value: "Email",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            context.read<JoinBloc>().launchPhone(
                              joinDataList[index].mobile.toString(),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10.0,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 5.0,
                                color: AppColor.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.phone,
                                    size: 30.0,
                                    color: AppColor.backgroundColor,
                                  ),
                                ),
                              ),

                              TextWidget(
                                value: "Phone",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
