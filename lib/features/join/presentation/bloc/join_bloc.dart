import 'package:share_plus/share_plus.dart';

import '../../../../config/exports/app_export.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

class JoinBloc extends Bloc<JoinEvent, JoinStates> {
  final GetJoinDataUseCase getJoinDataUseCase;
  StreamSubscription<List<JoinResponseModel>>? _subscription;

  JoinBloc({required this.getJoinDataUseCase}) : super(JoinInitialState()) {
    on<GetJoinEvent>((event, emit) async {
      emit(JoinLoadingState());

      await _subscription?.cancel();

      try {
        _subscription = getJoinDataUseCase().listen(
          (joinData) {
            if (!emit.isDone) {
              emit(JoinLoadedState(joinResponseModels: joinData));
            }
          },
          onError: (error) {
            if (!emit.isDone) {
              emit(JoinErrorState(message: error.toString()));
            }
          },
        );
      } catch (e) {
        if (!emit.isDone) {
          emit(JoinErrorState(message: e.toString()));
        }
      }
    });
  }

  Future<void> launchWhatsAppGroup(String groupLink) async {
    final Uri url = Uri.parse(groupLink);
    Share.share('Check out this website: $url');
  }

  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  Future<void> launchEmail(
    String emailAddress, {
    String? subject,
    String? body,
  }) async {
    String emailUriString = 'mailto:$emailAddress';
    if (subject != null || body != null) {
      emailUriString += '?';
      if (subject != null) {
        emailUriString += 'subject=${Uri.encodeComponent(subject)}';
        if (body != null) {
          emailUriString += '&';
        }
      }
      if (body != null) {
        emailUriString += 'body=${Uri.encodeComponent(body)}';
      }
    }

    final Uri emailUri = Uri.parse(emailUriString);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
