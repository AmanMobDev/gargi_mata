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

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

// class JoinBloc extends Bloc<JoinEvent, JoinStates> {
//   final JoinDataUseCase joinDataUseCase;
//   StreamSubscription<List<JoinResponseModel>>? _subscription;
//
//   JoinBloc({required this.joinDataUseCase}) : super(JoinInitialState()) {
//     on<GetJoinEvent>((event, emit) async {
//       emit(JoinLoadingState());
//
//       // Cancel any existing subscription
//       await _subscription?.cancel();
//
//       // Listen to Firestore real-time updates
//       _subscription = joinDataUseCase.execute().listen(
//         (joinData) {
//           add(UpdateJoinDataEvent(joinData));
//         },
//         onError: (error) {
//           emit(JoinErrorState(message: error.toString()));
//         },
//       );
//     });
//
//     // Handle the updated data
//     on<UpdateJoinDataEvent>((event, emit) {
//       emit(JoinLoadingState());
//       final result = joinDataUseCase.execute();
//
//       emit(JoinLoadedState(joinResponseModels: result));
//     });
//   }
//
//   @override
//   Future<void> close() async {
//     await _subscription?.cancel();
//     return super.close();
//   }
// }

// class JoinBloc extends Bloc<JoinEvent, JoinStates> {
//   final JoinDataUseCase? joinDataUseCase;
//
//   JoinBloc({required this.joinDataUseCase}) : super(JoinInitialState()) {
//     on<JoinEvent>(_getJoinData);
//   }
//
//   _getJoinData(JoinEvent event, Emitter<JoinStates> emit) async {
//     try {
//       emit(JoinLoadingState());
//       final result = joinDataUseCase!.execute();
//
//       emit(JoinLoadedState(joinResponseModels: result));
//     } catch (e) {
//       emit(JoinErrorState(message: e.toString()));
//     }
//   }
// }

// StreamBuilder<List<JoinResponseModel>>(
// stream: context.read<JoinBloc>().getJoinDataUseCase(),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(child: CircularProgressIndicator());
// } else if (snapshot.hasError) {
// return Center(child: Text('Error: ${snapshot.error}'));
// } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// return Center(child: Text("No data available"));
// } else {
// final joinDataList = snapshot.data!; // ✅ Now it's a List
//
// return ListView.builder(
// itemCount: joinDataList.length,
// itemBuilder: (context, index) {
// final joinData = joinDataList[index];
//
// return ListTile(
// title: Text(joinData.email), // Example UI
// subtitle: Text(joinData.mobile),
// );
// },
// );
// }
// },
// ),
