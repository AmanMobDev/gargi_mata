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
      appTitle: "",
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
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10.0,
                      children: [
                        TextWidget(value: mantraData[index].title),

                        Text(
                          mantraData[index].mantra,
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
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
