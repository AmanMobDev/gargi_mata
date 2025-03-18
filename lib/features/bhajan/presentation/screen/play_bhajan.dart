import '../../../../config/exports/app_export.dart';
import '../../data/model/bhajan_response_model.dart';
import '../bloc/play_bhajan/play_bhajan_bloc.dart';
import '../bloc/play_bhajan/play_bhajan_event.dart';
import '../bloc/play_bhajan/play_bhajan_state.dart';
import '../widget/bhajan_card.dart';

class PlayBhajanScreen extends StatefulWidget {
  const PlayBhajanScreen({super.key, required bhajan});

  @override
  State<PlayBhajanScreen> createState() => _PlayBhajanScreenState();
}

class _PlayBhajanScreenState extends State<PlayBhajanScreen> {
  MusicBloc? musicBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final BhajanResponseModel? bhajanData;
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Map<String, dynamic>) {
      debugPrint("Received bhajan data: ${arguments['bhajan']}");
      final bhajan = arguments['bhajan'];
      bhajanData = bhajan;
      BlocProvider.of<MusicBloc>(context).currentMusic = bhajanData;
      BlocProvider.of<MusicBloc>(context).add(LoadMusic(url: bhajanData!.url));
    } else {
      debugPrint("No valid arguments received!");
    }
  }

  @override
  void dispose() {
    musicBloc?.add(DisposeMusic());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appTitle: "भजन",
      child: BlocBuilder<MusicBloc, MusicState>(
        builder: (context, state) {
          if (state is MusicLoading) {
            return customCircularProgressIndicator();
          } else if (state is MusicLoaded) {
            return buildMusicPlayer(state, context);
          } else if (state is MusicError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Initial State'));
          }
        },
      ),
    );
  }
}
