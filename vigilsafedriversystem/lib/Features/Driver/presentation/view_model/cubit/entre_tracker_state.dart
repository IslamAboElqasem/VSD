part of 'entre_tracker_cubit.dart';

@immutable
sealed class EntreTrackerState {}

final class EntreTrackerInitial extends EntreTrackerState {}

final class EntreTrackerLoading extends EntreTrackerState {}

final class EntreTrackerSuccess extends EntreTrackerState {}

final class EntreTrackerFailure extends EntreTrackerState {
  final String errorMessage;
  EntreTrackerFailure({required this.errorMessage})

}
