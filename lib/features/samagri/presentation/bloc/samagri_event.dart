import 'package:equatable/equatable.dart';

/*******************************************************************************
 *Created By Aman Mishra
 ******************************************************************************/

abstract class SamagriEvents extends Equatable {
  const SamagriEvents();
  @override
  List<Object> get props => [];
}

class GetSamagriEvent extends SamagriEvents {}
