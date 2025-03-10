import '../../../../config/exports/app_export.dart';

class DaanBloc extends Bloc<DaanEvent, DaanStates> {
  final DaanUseCase daanDataUseCase;
  StreamSubscription<List<DaanResponseModel>>? _subscription;

  DaanBloc({required this.daanDataUseCase}) : super(DaanInitialState()) {
    on<GetDaanEvent>((event, emit) async {
      emit(DaanLoadingState());

      await _subscription?.cancel();

      try {
        _subscription = daanDataUseCase().listen(
          (daanData) {
            if (!emit.isDone) {
              emit(DaanDataLoadedState(daanResponseModel: daanData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(DaanErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(DaanErrorState(message: e.toString()));
        }
      }
    });
  }

  void copyToClipboard({BuildContext? context, String? text}) {
    Clipboard.setData(ClipboardData(text: text!.toString())).then(
      (value) {
        Utils.snackBarMessages(context: context, message: text.toString());
      },
      onError: (error) {
        Utils.toastMessages(message: error.toString());
      },
    );
  }
}
