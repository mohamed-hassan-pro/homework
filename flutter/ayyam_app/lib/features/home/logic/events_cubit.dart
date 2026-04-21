import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/events_repository.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final EventsRepository _repository;

  EventsCubit(this._repository) : super(EventsInitial());

  Future<void> loadEvents() async {
    // Prevent re-fetching if events are already loaded (e.g. on widget remount)
    if (state is EventsLoaded) return;
    
    emit(EventsLoading());
    try {
      final events = await _repository.getEvents(forceRefresh: false);
      emit(EventsLoaded(events));
    } catch (e) {
      // Assuming repository handles fallbacks and throws only if completely failed.
      emit(EventsError(e.toString()));
    }
  }

  Future<void> refreshEvents() async {
    try {
      final events = await _repository.getEvents(forceRefresh: true);
      emit(EventsLoaded(events));
    } catch (e) {
      if (state is EventsLoaded) {
        // preserve current state and notify error, but as simple implementation going to error
      }
      emit(EventsError(e.toString()));
    }
  }
}
