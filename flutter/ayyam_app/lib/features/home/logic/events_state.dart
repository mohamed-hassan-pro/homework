import 'package:equatable/equatable.dart';
import '../data/models/islamic_event.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object?> get props => [];
}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<IslamicEvent> events;
  final bool isFromCache; // true if offline/stale return

  const EventsLoaded(this.events, {this.isFromCache = false});

  @override
  List<Object?> get props => [events, isFromCache];
}

class EventsError extends EventsState {
  final String message;

  const EventsError(this.message);

  @override
  List<Object?> get props => [message];
}
