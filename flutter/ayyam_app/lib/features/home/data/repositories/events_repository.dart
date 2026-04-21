import '../datasources/events_local_ds.dart';
import '../datasources/events_local_calculator.dart';
import '../models/islamic_event.dart';

class EventsRepository {
  final EventsLocalDataSource _localDs;
  final EventsLocalCalculator _calculator;

  EventsRepository(this._localDs, this._calculator);

  Future<List<IslamicEvent>> getEvents({bool forceRefresh = false}) async {
    // Check cache first (unless forced refresh)
    if (!forceRefresh && !_localDs.isCacheStale()) {
      final cached = _localDs.getCachedEvents();
      if (cached.isNotEmpty) {
        return _sortEvents(cached);
      }
    }

    try {
      // Calculate locally — no internet needed
      final currentYear = _calculator.getCurrentHijriYear();
      final events = _calculator.calculateEvents(currentYear);
      
      // Cache the calculated events
      await _localDs.cacheEvents(events);
      return _sortEvents(events);
    } catch (e) {
      // Fallback to stale cache if calculation somehow fails
      final cached = _localDs.getCachedEvents();
      if (cached.isNotEmpty) {
        return _sortEvents(cached);
      }
      throw Exception('Failed to calculate events: $e');
    }
  }

  List<IslamicEvent> _sortEvents(List<IslamicEvent> events) {
    // Sort logic: 
    // - Future events and today come first, sorted by remaining days ASC
    // - Past events go to the bottom
    final sorted = List<IslamicEvent>.from(events);
    sorted.sort((a, b) {
      if (a.isPassed != b.isPassed) {
        return a.isPassed ? 1 : -1; // Future before passed
      }
      if (a.isPassed && b.isPassed) {
        return -a.remainingDays.compareTo(-b.remainingDays);
      }
      // Both in future
      return a.remainingDays.compareTo(b.remainingDays);
    });
    return sorted;
  }
}
