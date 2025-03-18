import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../bloc/bhajan_list/bhajan_state.dart';

class BhajanScreen extends StatefulWidget {
  const BhajanScreen({super.key});

  @override
  State<BhajanScreen> createState() => _BhajanScreenState();
}

class _BhajanScreenState extends State<BhajanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      if (mounted) {
        context.read<BhajanBloc>().add(LoadAudioList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "भजन",
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: BlocBuilder<BhajanBloc, BhajanState>(
          bloc: context.read<BhajanBloc>(),
          builder: (context, state) {
            List<BhajanResponseModel> audioList = [];

            if (state is AudioLoading) {
              return customCircularProgressIndicator();
            } else if (state is AudioLoaded) {
              audioList = state.audioList; // Extract audio list
            } else if (state is AudioPlaying && state is AudioPaused) {
              audioList =
                  (state as dynamic)
                      .audioList; // Ensure we always have the list
            } else if (state is AudioError) {
              return Center(child: Text(state.message));
            }

            return ListView.builder(
              itemCount: audioList.length,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    debugPrint("Sending bhajan data: ${audioList[index]}");

                    Navigator.pushNamed(
                      context,
                      RouteName.playBhajanScreen,
                      arguments: {"bhajan": audioList[index]},
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                audioList[index].fileName,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColor.backgroundColor,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
