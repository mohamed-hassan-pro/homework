import '../../../../core/services/storage_service.dart';
import '../models/islamic_event.dart';

class EventsLocalDataSource {
  List<IslamicEvent> getCachedEvents() {
    return StorageService.eventsBox.values.toList();
  }

  Future<void> cacheEvents(List<IslamicEvent> events) async {
    await StorageService.eventsBox.clear();
    await StorageService.eventsBox.addAll(events);
    await StorageService.updateSyncTimestamp();
  }

  bool isCacheStale() {
    final lastSync = StorageService.getLastSyncTimestamp();
    if (lastSync == null) return true;

    final now = DateTime.now();
    // Re-fetch if cache is older than 15 days just to ensure we catch any updates or next year changes
    return now.difference(lastSync).inDays > 15;
  }
}
