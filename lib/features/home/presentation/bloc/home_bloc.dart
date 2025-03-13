import 'package:gargi_mata/features/home/data/model/response/home_response_model.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final HomeUseCase homeUseCase;
  StreamSubscription<List<HomeResponseModel>>? _subscription;

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
}
