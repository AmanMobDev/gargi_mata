import 'package:gargi_mata/features/mantra/data/model/request/mantra_response_model.dart';
import 'package:gargi_mata/features/mantra/presentation/bloc/mantra_bloc.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class MantraScreen extends StatefulWidget {
  const MantraScreen({super.key});

  @override
  State<MantraScreen> createState() => _MantraScreenState();
}

class _MantraScreenState extends State<MantraScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "मंत्र",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: StreamBuilder<List<MantraResponseModel>>(
          stream: context.read<MantraBloc>().getMantraUseCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              final mantraData = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: mantraData.length,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    // spacing: 10.0,
                    children: [
                      SizedBox(height: 10.0),
                      TextWidget(
                        value: mantraData[index].title,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        mantraData[index].mantra,
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      // Divider(
                      //   color: AppColor.backgroundColor,
                      //   height: 2.0,
                      //   thickness: 2.0,
                      //   indent: 10.0,
                      //   endIndent: 10.0,
                      // ),
                      // SizedBox(height: 10.0),
                    ],
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
