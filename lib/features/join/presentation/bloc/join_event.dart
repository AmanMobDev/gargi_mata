import '../../../../config/exports/app_export.dart';

abstract class JoinEvent extends Equatable {
  const JoinEvent();

  @override
  List<Object> get props => [];
}

class GetJoinEvent extends JoinEvent {}
