import 'package:gargi_mata/features/samagri/data/model/response/samagri_response_model.dart';
import 'package:gargi_mata/features/samagri/presentation/bloc/samagri_bloc.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class SamagriScreen extends StatefulWidget {
  const SamagriScreen({super.key});

  @override
  State<SamagriScreen> createState() => _SamagriScreenState();
}

class _SamagriScreenState extends State<SamagriScreen> {
  // final List<Map<String, dynamic>> samagri = [
  //   {"item": "दीपक", "weight": "3", "unit": "p"},
  //   {"item": "साफ चावली", "weight": "100", "unit": "g"},
  //   {"item": "श्रृंगार का सामान", "weight": "2", "unit": "p"},
  //   {"item": "लाल चुनरी", "weight": "100", "unit": "miter"},
  //   {"item": "साफ चावली", "weight": "100", "unit": "g"},
  // ];

  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  // Future<void> uploadData() async {
  //   CollectionReference collectionRef = firestore.collection('samagri');
  //
  //   for (var item in samagri) {
  //     await collectionRef.add(item);
  //   }
  //
  //   debugPrint("Data uploaded successfully!");
  // }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // uploadData();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "सामग्री",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: StreamBuilder<List<SamagriResponseModel>>(
          stream: context.read<SamagriBloc>().samagriUseCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              final samagriDataList = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: samagriDataList.length,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10.0,
                      children: [
                        Text(
                          samagriDataList[index].item,
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Row(
                          spacing: 5.0,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              samagriDataList[index].weight,
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              samagriDataList[index].unit,
                              style: TextStyle(
                                color: AppColor.blackColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                physics: BouncingScrollPhysics(),
              );
            }
          },
        ),
      ),
    );
  }
}
