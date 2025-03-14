import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashInitialEvent>(_navigateHome);
  }

  Future<void> _navigateHome(
    SplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoadingState());
    try {
      await Future.delayed(Duration(seconds: 3), () {
        emit(SplashLoadedState());
      });
    } catch (e) {
      debugPrint("ERROR");
      emit(SplashErrorState(message: e.toString()));
    }
  }
}
