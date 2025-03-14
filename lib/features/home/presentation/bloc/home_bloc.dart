import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final HomeUseCase homeUseCase;
  StreamSubscription<List<HomeResponseModel>>? _subscription;

  static List<Map<String, String>> imgList = [
    {"name": "कात्यायनी", "image": "assets/images/कात्यायनी.jpeg"},
    {"name": "कालरात्रि", "image": "assets/images/कालरात्रि.webp"},
    {"name": "कुष्मांडा", "image": "assets/images/कुष्मांडा.png"},
    {"name": "चंद्रघंटा", "image": "assets/images/चंद्रघंटा.png"},
    {"name": "ब्रह्मचारिणी", "image": "assets/images/ब्रह्मचारिणी.gif"},
    // {"name": "ब्रह्मचारिणी", "image": "assets/images/ब्रह्मचारिणी.gif"},
    {"name": "महागौरी", "image": "assets/images/महागौरी.png"},
    {"name": "शैलपुत्री", "image": "assets/images/शैलपुत्री.jpeg"},
    {"name": "सिद्धिदात्री", "image": "assets/images/सिद्धिदात्री.png"},
    {"name": "स्कन्दमाता", "image": "assets/images/स्कन्दमाता.jpeg"},
    // {"name": "गार्गी माता", "image": "assets/images/gargi.jpeg"},
  ];

  HomeBloc({required this.homeUseCase}) : super(HomeInitialState()) {
    on<GetHomeEvent>((event, emit) async {
      emit(HomeLoading());

      await _subscription?.cancel();

      try {
        _subscription = homeUseCase().listen(
          (homeData) {
            if (!emit.isDone) {
              emit(HomeLoaded(homeResponseModel: homeData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(HomeError(error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(HomeError(e.toString()));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel(); // Cancel the subscription to avoid memory leaks
    return super.close();
  }
}
