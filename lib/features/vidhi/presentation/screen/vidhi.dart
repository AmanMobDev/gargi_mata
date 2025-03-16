import 'package:gargi_mata/features/vidhi/data/model/response/vidhi_response_model.dart';
import 'package:gargi_mata/features/vidhi/presentation/bloc/vidhi_bloc.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/
class VidhiScreen extends StatefulWidget {
  const VidhiScreen({super.key});

  @override
  State<VidhiScreen> createState() => _VidhiScreenState();
}

class _VidhiScreenState extends State<VidhiScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "विधि",
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: StreamBuilder<List<VidhiResponseModel>>(
          stream: context.read<VidhiBloc>().getVidhiUseCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              final vidhiData = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: vidhiData.length,
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
                        value: vidhiData[index].title,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 15.0),
                      TextWidget(
                        value: vidhiData[index].description,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.justify,
                      ),
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
