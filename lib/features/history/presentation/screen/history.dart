import 'package:gargi_mata/features/history/data/model/response/history_response_model.dart';
import 'package:gargi_mata/features/history/presentation/bloc/history_bloc.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 * Created By Aman Mishra
 ******************************************************************************/

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "इतिहास",
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: StreamBuilder<List<HistoryResponseModel>>(
          stream: context.read<HistoryBloc>().getHistoryDataUseCase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return customCircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No data available"));
            } else {
              final historyDataList = snapshot.data!;
              return ListView.builder(
                itemCount: historyDataList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: TextWidget(
                          value: historyDataList[index].historyDescription,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.justify,
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
