import '../../../../config/exports/app_export.dart';

abstract class DaanEvent extends Equatable {
  const DaanEvent();
  @override
  List<Object> get props => [];
}

class GetDaanEvent extends DaanEvent {}

// New event to update UI state
class UpdateDaanDataEvent extends DaanEvent {
  final List<DaanResponseModel> daanResponseModel;
  const UpdateDaanDataEvent(this.daanResponseModel);
}
