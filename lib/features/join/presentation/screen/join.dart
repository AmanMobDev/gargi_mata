import '../../../../config/exports/app_export.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  Future<void> launchWhatsAppGroup(String groupLink) async {
    final Uri url = Uri.parse(groupLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  Future<void> launchEmail(
    String emailAddress, {
    String? subject,
    String? body,
  }) async {
    String emailUriString = 'mailto:$emailAddress';
    if (subject != null || body != null) {
      emailUriString += '?';
      if (subject != null) {
        emailUriString += 'subject=${Uri.encodeComponent(subject)}';
        if (body != null) {
          emailUriString += '&';
        }
      }
      if (body != null) {
        emailUriString += 'body=${Uri.encodeComponent(body)}';
      }
    }

    final Uri emailUri = Uri.parse(emailUriString);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            final joinDataList = snapshot.data!;
            return ListView.builder(
              itemCount: joinDataList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      elevation: 8.0,
                      margin: EdgeInsets.only(top: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: AppColor.whiteColor,
                      child: Image.asset(
                        'assets/images/qr.jpeg',
                        scale: 1.0,
                        fit: BoxFit.contain,
                        width: 250.0,
                        height: 250.0,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        launchWhatsAppGroup(joinDataList[index].whatsappLink);
                      },
                      child: Card(
                        elevation: 8.0,
                        margin: EdgeInsets.only(top: 40.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: AppColor.whiteColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Icon(Icons.join_right, size: 24.0),
                            SizedBox(width: 5.0),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),

                    Divider(
                      height: 10.0,
                      thickness: 2.0,
                      endIndent: 10.0,
                      indent: 10.0,
                      color: AppColor.backgroundColorWithOpacity,
                    ),

                    SizedBox(height: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      spacing: 10.0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launchEmail(joinDataList[index].email.toString());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 15.0,
                            children: [
                              Icon(
                                Icons.email,
                                size: 24.0,
                                color: AppColor.blackColor,
                              ),

                              CustomTextWidget(
                                value: joinDataList[index].email.toString(),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            launchPhone(joinDataList[index].mobile.toString());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 15.0,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 24.0,
                                color: AppColor.blackColor,
                              ),

                              CustomTextWidget(
                                value: joinDataList[index].mobile.toString(),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackColor,
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
